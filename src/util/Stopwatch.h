// Simple timer for real elapsed time.  Operates similar to a stopwatch.
#ifndef ROSE_Stopwatch_H
#define ROSE_Stopwatch_H

#include <sys/time.h>

namespace rose {

/** Simple elapsed time.
 *
 * @code
 *  Stopwatch stopwatch; // starts immediately unless false argument is given
 *  do_something();
 *  std::cerr <<"that took " <<stopwatch.stop() <<" seconds.\n";
 * @endcode
 *
 *  All times are returned as floating point number of seconds.  The underlying data structure has microsecond resolution.
 */
class Stopwatch {
    struct timeval begin_;
    double elapsed_;
    bool running_;
public:

    /** Construct and optionally start a timer.  The timer is started immediately unless the constructor is invoked with a
     *  false argument. */
    explicit Stopwatch(bool start=true)
        : elapsed_(0.0), running_(false) {
        start && this->start();
    }

    /** Reset the timer to zero. The timer is stopped if it is running.  Returns the accumulated time. */
    double clear() { return stop(true); }

    /** Start the timer. If @p clear is set then the timer is first stopped (if necessary) and reset to zero before starting
     *  it.  Otherwise if the timer is already running this call does nothing. In any case, the return value is the time
     *  accumulated when the timer was most recently started (either just now or earlier). */
    double start(bool clear=false);

    /** Stop the timer.  If the timer was running then it is stopped and the elapsed time is accumulated, otherwise the timer
     *  remains in the stopped state an no additional time is accumulated.  If @p clear is set, then the accumlated time is
     *  reset to zero.  In any case, the return value is the accumulated time before being optionally reset to zero. */
    double stop(bool clear=false);
};

} // namespace
#endif
