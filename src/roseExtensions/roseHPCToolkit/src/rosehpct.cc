// -*- mode:C++; tab-width:8; indent-tabs-mode:nil -*-
/*!
 *  \file rosehpct/rosehpct.hh
 *  \brief End-user interface to \ref ROSEHPCT.
 *  \ingroup ROSEHPCT_HL
 *
 *  $Id: rosehpct.cc,v 1.1 2008/01/08 02:56:43 dquinlan Exp $
 */

#include "rose.h"

#include "rosehpct/rosehpct.hh"
//#include "rosehpct/util/general.hh"
#include "commandline_processing.h"

using namespace std;

namespace RoseHPCT
{
   bool enable_debug; // output debug information
   bool gprof_only=false; //using gprof instead of HPCToolkit, TODO what if some picky guys want both?
   std::string gprof_file_name; // we expect only one gprof result file for a project
};

using namespace GenUtil;
using namespace RoseHPCT;

//! Default command-line prefix for ROSE options
// Liao, follow Jeremiah's transition from char* to string
//static const char* OPTION_PREFIX_ROSE = "-rose:";
static const string OPTION_PREFIX_ROSE("-rose:");

//! Default command-option separator tag
static const string OPTION_VALUE_SEPARATOR("$^");
//static const char* OPTION_VALUE_SEPARATOR = "$^";

//! ROSE-HPCT profile option
//static const string OPTION_HPCTPROF ("*hpct:prof");
static const char* OPTION_HPCTPROF = "*hpct:prof";

//! ROSE-HPCT equivalent-path option
//static const string OPTION_HPCTEQPATH = ("*hpct:eqpath");
static const char* OPTION_HPCTEQPATH = "*hpct:eqpath";

//! Wrapper around the SLA string option processing routine.
static
int
getRoseOptionValues (vector<string> & argvList, const char* opt_name,
		     vector<string>& values)
{
  const string x(opt_name);
  string *y=NULL;
  int num_matches = sla_str (argvList,
			     OPTION_PREFIX_ROSE,
			     OPTION_VALUE_SEPARATOR,
			     x,
			     y);
  if (num_matches > 0)
    {
      string* raw_values = new string[num_matches];
      //char** raw_values = new char*[num_matches];
      sla_str (argvList,
	       OPTION_PREFIX_ROSE, OPTION_VALUE_SEPARATOR, x,
	       raw_values);
      for (int i = 0; i < num_matches; i++)
	values.push_back (string (raw_values[i]));
    }
  return num_matches;
}

//! Extra command line processing tasks
static 
void commandLineProcessing(std::vector<std::string> &argvList)
{
  if (CommandlineProcessing::isOption (argvList,"-rose:hpct:","enable_debug",true))
  {
    cout<<"Enabling debugging mode for RoseHPCT..."<<endl;
    enable_debug= true;
  }
  else
    enable_debug= false;

  if (CommandlineProcessing::isOptionWithParameter (argvList,"-rose:gprof:","linebyline",gprof_file_name,true))
  {
    cout<<"Enabling gprof result from "<<gprof_file_name<<" as an alternative to HPCToolKit..."<<endl;
    gprof_only= true;
  }
  else
    gprof_only= false;

    // keep --help option after processing, let other modules respond also
  if( (CommandlineProcessing::isOption (argvList,"--help","",false))||
      (CommandlineProcessing::isOption (argvList,"-help","",false)))
  {
    cout<<"RoseHPCT-specific options"<<endl;
    cout<<"\t-rose:hpct:prof                     specify xml format performance results"<<endl;
    cout<<"\t-rose:gprof:linebyline              specify a line-by-line performance text file generated by gprof -l -L a.out gmon.out"<<endl;
    //    cout<<"\t-rose:gprof:function                specify a function-level performance text file generated by gprof a.out gmon.out"<<endl;
    cout<<"\t-rose:hpct:eqpath                   specify equivalent path for file paths used in the xml performance file "<<endl;
    cout<<"\t-rose:hpct:enable_debug             run roseHPCT in a debugging mode and annotate source with metrics as comments"<<endl;
    cout <<"---------------------------------------------------------------"<<endl;  
  }
}

/*!
 *
 *  This routine extracts command-line flags of the form:
 *  \code
 *  -rose:hpct:prof profile_data.xml
 *  \endcode
 *  where "profile_data.xml" is an HPCToolkit-generated XML file
 *  containing profiling data in HPCViewer profile scope tree format,
 *  and returns a list of all specified profile data filenames.
 *
 *  \see RoseHPCT::getEquivPaths, RoseHPCT::loadProfilingFiles
 */
FilenameList_t
RoseHPCT::getProfileOptions (vector<string>& argvList)
{
  FilenameList_t filenames;
  getRoseOptionValues (argvList, OPTION_HPCTPROF, filenames);
  return filenames;
}

/*!
 *
 *  This routine extracts command-line flags of the form:
 *  \code
 *  -rose:hpct:eqpath <source>=<dest>
 *  \endcode
 *  and returns a map containing all (source, dest) key-value pairs.
 *
 *  \see RoseHPCT::getProfileOptions, RoseHPCT::loadProfilingFiles
 */
EquivPathMap_t
RoseHPCT::getEquivPaths (vector<string>& argvList)
{
  vector<string> raw_eqpaths;
  getRoseOptionValues (argvList, OPTION_HPCTEQPATH, raw_eqpaths);

  EquivPathMap_t eqpaths;
  for (vector<string>::const_iterator i = raw_eqpaths.begin ();
       i != raw_eqpaths.end ();
       ++i)
    {
      string::size_type pos = i->find ("=", 0);
      string a;
      string b;
      if (pos == string::npos) // not found
	{
	  a = *i;
	  b = ".";
	}
      else
	{
	  a = i->substr (0, pos);
	  b = i->substr (pos+1, i->size () - pos);
	}
      cerr << "[Establishing path equivalence: "
	   << "'" << a << "'"
	   << " -> "
	   << "'" << b << "'"
	   << "]" << endl;
      eqpaths[a] = b;
    }
  return eqpaths;
}

/*!
 *  \brief
 *
 *  This routine processes the given command-line arguments,
 *  extracting options that specify what HPCToolkit XML data files 
 *  or GNU gprof line-by-line text file to
 *  use and how to interpret them. For more information on the flags
 *  recognized, see \ref RoseHPCT::getProfileOptions and \ref
 *  RoseHPCT::getEquivPaths .
 *
 *  \returns A list of HPCToolkit "profiled program trees" which store
 *  the profile data in an abstract form that mimics the program
 *  structure.
 */
RoseHPCT::ProgramTreeList_t
RoseHPCT::loadProfilingFiles (vector<string>& argvList)
{
  commandLineProcessing(argvList);// handle -help, -rose:hpct:enable_debug, -rose:gprof:linebyline file_name  here
  EquivPathMap_t eqpaths = getEquivPaths (argvList);
  FilenameList_t filenames;
  ProgramTreeList_t profiles; 
  // load profiling result files, from either gprof or hpctoolkit
  if (gprof_only)
  {
    std::vector<gprof_info > v;
    read_gprof_info( gprof_file_name.c_str(), v );
    if (enable_debug)
    {
      std::vector< gprof_info >:: iterator iter = v.begin();
      for (;iter!=v.end();iter++)
        std::cout<<(*iter)<<std::endl;
    }
    profiles = loadGprofVec(v);
  }
  else
  {
    filenames = getProfileOptions (argvList);
    profiles = loadXMLTrees (filenames);
  }
  // convert file paths to equivalent ones
  for (ProgramTreeList_t::iterator hpctree = profiles.begin ();
       hpctree != profiles.end ();
       ++hpctree)
    {
      postProcessingProfIR(*hpctree, eqpaths);
    }
  return profiles;
}

void
RoseHPCT::attachMetricsRaw (const ProgramTreeList_t& profiles,
                            SgProject* proj,
                            bool verbose)
{
  map<string, size_t> metrics;
  for (ProgramTreeList_t::const_iterator hpctree = profiles.begin ();
       hpctree != profiles.end ();
       ++hpctree)
    attachMetrics (*hpctree, proj, verbose);
}

void
RoseHPCT::attachMetrics (const ProgramTreeList_t& profiles,
                         SgProject* proj,
                         bool verbose)
{
  attachMetricsRaw (profiles, proj, verbose);

  // Propagate through parent scopes.
  map<string, size_t> metrics;
  for (ProgramTreeList_t::const_iterator hpctree = profiles.begin ();
       hpctree != profiles.end ();
       ++hpctree)
    collectMetricNames (*hpctree, metrics);
  propagateMetrics (proj, getKeys (metrics));
}

// eof
