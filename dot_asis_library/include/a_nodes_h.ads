pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with Interfaces.C.Extensions;

package a_nodes_h is

   type Program_Text is new Interfaces.C.Strings.chars_ptr;  -- a_nodes.h:11

   subtype ASIS_Integer is int;  -- a_nodes.h:12

   subtype Node_ID is int;  -- a_nodes.h:13

   type u_Element_ID_Struct is record
      Node : aliased Node_ID;  -- a_nodes.h:24
      Kind : aliased int;  -- a_nodes.h:25
   end record;
   pragma Convention (C_Pass_By_Copy, u_Element_ID_Struct);  -- a_nodes.h:23

   subtype Element_ID_Struct is u_Element_ID_Struct;

   subtype Element_ID is u_Element_ID_Struct;

   type Element_ID_Ptr is access all Element_ID;  -- a_nodes.h:45

   type u_Element_ID_Array_Struct is record
      Length : aliased int;  -- a_nodes.h:50
      IDs : Element_ID_Ptr;  -- a_nodes.h:51
   end record;
   pragma Convention (C_Pass_By_Copy, u_Element_ID_Array_Struct);  -- a_nodes.h:49

   subtype Element_ID_Array_Struct is u_Element_ID_Array_Struct;

   subtype Element_ID_List is u_Element_ID_Array_Struct;

   type Element_Kinds is 
     (Not_An_Element,
      A_Pragma,
      A_Defining_Name,
      A_Declaration,
      A_Definition,
      An_Expression,
      An_Association,
      A_Statement,
      A_Path,
      A_Clause,
      An_Exception_Handler);
   pragma Convention (C, Element_Kinds);  -- a_nodes.h:56

   subtype Access_Type_Definition is u_Element_ID_Struct;

   subtype Association is u_Element_ID_Struct;

   subtype Association_List is u_Element_ID_Array_Struct;

   subtype Case_Statement_Alternative is u_Element_ID_Struct;

   subtype Clause is u_Element_ID_Struct;

   subtype Component_Clause is u_Element_ID_Struct;

   subtype Component_Clause_List is u_Element_ID_Array_Struct;

   subtype Component_Declaration is u_Element_ID_Struct;

   subtype Component_Definition is u_Element_ID_Struct;

   subtype Constraint_ID is u_Element_ID_Struct;

   subtype Constraint is u_Element_ID_Struct;

   subtype Context_Clause is u_Element_ID_Struct;

   subtype Context_Clause_List is u_Element_ID_Array_Struct;

   subtype Declaration is u_Element_ID_Struct;

   subtype Declaration_ID is u_Element_ID_Struct;

   subtype Declaration_List is u_Element_ID_Array_Struct;

   subtype Declarative_Item_List is u_Element_ID_Array_Struct;

   subtype Defining_Name_ID is u_Element_ID_Struct;

   subtype Definition is u_Element_ID_Struct;

   subtype Definition_ID is u_Element_ID_Struct;

   subtype Definition_List is u_Element_ID_Array_Struct;

   subtype Discrete_Range is u_Element_ID_Struct;

   subtype Discrete_Range_ID is u_Element_ID_Struct;

   subtype Discrete_Range_List is u_Element_ID_Array_Struct;

   subtype Discrete_Subtype_Definition is u_Element_ID_Struct;

   subtype Discrete_Subtype_Definition_ID is u_Element_ID_Struct;

   subtype Discriminant_Association is u_Element_ID_Struct;

   subtype Discriminant_Association_List is u_Element_ID_Array_Struct;

   subtype Discriminant_Specification_List is u_Element_ID_Array_Struct;

   subtype Defining_Name is u_Element_ID_Struct;

   subtype Defining_Name_List is u_Element_ID_Array_Struct;

   subtype Exception_Handler is u_Element_ID_Struct;

   subtype Exception_Handler_List is u_Element_ID_Array_Struct;

   subtype Expression is u_Element_ID_Struct;

   subtype Expression_ID is u_Element_ID_Struct;

   subtype Expression_List is u_Element_ID_Array_Struct;

   subtype Expression_Path_List is u_Element_ID_Array_Struct;

   subtype Formal_Type_Definition is u_Element_ID_Struct;

   subtype Generic_Formal_Parameter is u_Element_ID_Struct;

   subtype Generic_Formal_Parameter_List is u_Element_ID_Array_Struct;

   subtype Identifier is u_Element_ID_Struct;

   subtype Identifier_List is u_Element_ID_Array_Struct;

   subtype Name is u_Element_ID_Struct;

   subtype Name_ID is u_Element_ID_Struct;

   subtype Name_List is u_Element_ID_Array_Struct;

   subtype Parameter_Specification is u_Element_ID_Struct;

   subtype Parameter_Specification_List is u_Element_ID_Array_Struct;

   subtype Path is u_Element_ID_Struct;

   subtype Path_List is u_Element_ID_Array_Struct;

   subtype Pragma_Element is u_Element_ID_Struct;

   subtype Pragma_Element_ID_List is u_Element_ID_Array_Struct;

   subtype Range_Constraint is u_Element_ID_Struct;

   subtype Record_Component is u_Element_ID_Struct;

   subtype Record_Component_List is u_Element_ID_Array_Struct;

   subtype Record_Definition is u_Element_ID_Struct;

   subtype Representation_Clause is u_Element_ID_Struct;

   subtype Representation_Clause_List is u_Element_ID_Array_Struct;

   subtype Root_Type_Definition is u_Element_ID_Struct;

   subtype Select_Alternative is u_Element_ID_Struct;

   subtype Statement is u_Element_ID_Struct;

   subtype Statement_ID is u_Element_ID_Struct;

   subtype Statement_List is u_Element_ID_Array_Struct;

   subtype Subtype_Indication is u_Element_ID_Struct;

   subtype Subtype_Indication_ID is u_Element_ID_Struct;

   subtype Subtype_Mark is u_Element_ID_Struct;

   subtype Type_Definition is u_Element_ID_Struct;

   subtype Type_Definition_ID is u_Element_ID_Struct;

   subtype Variant is u_Element_ID_Struct;

   subtype Variant_Component_List is u_Element_ID_Array_Struct;

   subtype Variant_List is u_Element_ID_Array_Struct;

   type Operator_Kinds is 
     (Not_An_Operator,
      An_And_Operator,
      An_Or_Operator,
      An_Xor_Operator,
      An_Equal_Operator,
      A_Not_Equal_Operator,
      A_Less_Than_Operator,
      A_Less_Than_Or_Equal_Operator,
      A_Greater_Than_Operator,
      A_Greater_Than_Or_Equal_Operator,
      A_Plus_Operator,
      A_Minus_Operator,
      A_Concatenate_Operator,
      A_Unary_Plus_Operator,
      A_Unary_Minus_Operator,
      A_Multiply_Operator,
      A_Divide_Operator,
      A_Mod_Operator,
      A_Rem_Operator,
      An_Exponentiate_Operator,
      An_Abs_Operator,
      A_Not_Operator);
   pragma Convention (C, Operator_Kinds);  -- a_nodes.h:151

   type Pragma_Kinds is 
     (Not_A_Pragma,
      An_All_Calls_Remote_Pragma,
      An_Assert_Pragma,
      An_Assertion_Policy_Pragma,
      An_Asynchronous_Pragma,
      An_Atomic_Pragma,
      An_Atomic_Components_Pragma,
      An_Attach_Handler_Pragma,
      A_Controlled_Pragma,
      A_Convention_Pragma,
      A_CPU_Pragma,
      A_Default_Storage_Pool_Pragma,
      A_Detect_Blocking_Pragma,
      A_Discard_Names_Pragma,
      A_Dispatching_Domain_Pragma,
      An_Elaborate_Pragma,
      An_Elaborate_All_Pragma,
      An_Elaborate_Body_Pragma,
      An_Export_Pragma,
      An_Independent_Pragma,
      A_Independent_Components_Pragma,
      An_Import_Pragma,
      An_Inline_Pragma,
      An_Inspection_Point_Pragma,
      An_Interrupt_Handler_Pragma,
      An_Interrupt_Priority_Pragma,
      A_Linker_Options_Pragma,
      A_List_Pragma,
      A_Locking_Policy_Pragma,
      A_No_Return_Pragma,
      A_Normalize_Scalars_Pragma,
      An_Optimize_Pragma,
      A_Pack_Pragma,
      A_Page_Pragma,
      A_Partition_Elaboration_Policy_Pragma,
      A_Preelaborable_Initialization_Pragma,
      A_Preelaborate_Pragma,
      A_Priority_Pragma,
      A_Priority_Specific_Dispatching_Pragma,
      A_Profile_Pragma,
      A_Pure_Pragma,
      A_Queuing_Policy_Pragma,
      A_Relative_Deadline_Pragma,
      A_Remote_Call_Interface_Pragma,
      A_Remote_Types_Pragma,
      A_Restrictions_Pragma,
      A_Reviewable_Pragma,
      A_Shared_Passive_Pragma,
      A_Storage_Size_Pragma,
      A_Suppress_Pragma,
      A_Task_Dispatching_Policy_Pragma,
      An_Unchecked_Union_Pragma,
      An_Unsuppress_Pragma,
      A_Volatile_Pragma,
      A_Volatile_Components_Pragma,
      An_Implementation_Defined_Pragma);
   pragma Convention (C, Pragma_Kinds);  -- a_nodes.h:181

   type Pragma_Struct is record
      Pragma_Kind : aliased Pragma_Kinds;  -- a_nodes.h:242
      Pragmas : aliased Pragma_Element_ID_List;  -- a_nodes.h:243
      Pragma_Name_Image : Program_Text;  -- a_nodes.h:244
      Pragma_Argument_Associations : aliased Association_List;  -- a_nodes.h:245
   end record;
   pragma Convention (C_Pass_By_Copy, Pragma_Struct);  -- a_nodes.h:241

   type Defining_Name_Kinds is 
     (Not_A_Defining_Name,
      A_Defining_Identifier,
      A_Defining_Character_Literal,
      A_Defining_Enumeration_Literal,
      A_Defining_Operator_Symbol,
      A_Defining_Expanded_Name);
   pragma Convention (C, Defining_Name_Kinds);  -- a_nodes.h:256

   type Defining_Name_Struct is record
      Defining_Name_Kind : aliased Defining_Name_Kinds;  -- a_nodes.h:267
      Defining_Name_Image : Interfaces.C.Strings.chars_ptr;  -- a_nodes.h:268
      References : aliased Name_List;  -- a_nodes.h:269
      Is_Referenced : aliased Extensions.bool;  -- a_nodes.h:270
      Operator_Kind : aliased Operator_Kinds;  -- a_nodes.h:274
      Position_Number_Image : Interfaces.C.Strings.chars_ptr;  -- a_nodes.h:277
      Representation_Value_Image : Interfaces.C.Strings.chars_ptr;  -- a_nodes.h:278
      Defining_Prefix : aliased Name_ID;  -- a_nodes.h:280
      Defining_Selector : aliased Defining_Name_ID;  -- a_nodes.h:281
      Corresponding_Constant_Declaration : aliased Declaration_ID;  -- a_nodes.h:283
      Corresponding_Generic_Element : aliased Defining_Name_ID;  -- a_nodes.h:286
   end record;
   pragma Convention (C_Pass_By_Copy, Defining_Name_Struct);  -- a_nodes.h:266

   type Declaration_Kinds is 
     (Not_A_Declaration,
      An_Ordinary_Type_Declaration,
      A_Task_Type_Declaration,
      A_Protected_Type_Declaration,
      An_Incomplete_Type_Declaration,
      A_Tagged_Incomplete_Type_Declaration,
      A_Private_Type_Declaration,
      A_Private_Extension_Declaration,
      A_Subtype_Declaration,
      A_Variable_Declaration,
      A_Constant_Declaration,
      A_Deferred_Constant_Declaration,
      A_Single_Task_Declaration,
      A_Single_Protected_Declaration,
      An_Integer_Number_Declaration,
      A_Real_Number_Declaration,
      An_Enumeration_Literal_Specification,
      A_Discriminant_Specification,
      A_Component_Declaration,
      A_Loop_Parameter_Specification,
      A_Generalized_Iterator_Specification,
      An_Element_Iterator_Specification,
      A_Procedure_Declaration,
      A_Function_Declaration,
      A_Parameter_Specification,
      A_Procedure_Body_Declaration,
      A_Function_Body_Declaration,
      A_Return_Variable_Specification,
      A_Return_Constant_Specification,
      A_Null_Procedure_Declaration,
      An_Expression_Function_Declaration,
      A_Package_Declaration,
      A_Package_Body_Declaration,
      An_Object_Renaming_Declaration,
      An_Exception_Renaming_Declaration,
      A_Package_Renaming_Declaration,
      A_Procedure_Renaming_Declaration,
      A_Function_Renaming_Declaration,
      A_Generic_Package_Renaming_Declaration,
      A_Generic_Procedure_Renaming_Declaration,
      A_Generic_Function_Renaming_Declaration,
      A_Task_Body_Declaration,
      A_Protected_Body_Declaration,
      An_Entry_Declaration,
      An_Entry_Body_Declaration,
      An_Entry_Index_Specification,
      A_Procedure_Body_Stub,
      A_Function_Body_Stub,
      A_Package_Body_Stub,
      A_Task_Body_Stub,
      A_Protected_Body_Stub,
      An_Exception_Declaration,
      A_Choice_Parameter_Specification,
      A_Generic_Procedure_Declaration,
      A_Generic_Function_Declaration,
      A_Generic_Package_Declaration,
      A_Package_Instantiation,
      A_Procedure_Instantiation,
      A_Function_Instantiation,
      A_Formal_Object_Declaration,
      A_Formal_Type_Declaration,
      A_Formal_Incomplete_Type_Declaration,
      A_Formal_Procedure_Declaration,
      A_Formal_Function_Declaration,
      A_Formal_Package_Declaration,
      A_Formal_Package_Declaration_With_Box);
   pragma Convention (C, Declaration_Kinds);  -- a_nodes.h:297

   type Declaration_Origins is 
     (Not_A_Declaration_Origin,
      An_Explicit_Declaration,
      An_Implicit_Predefined_Declaration,
      An_Implicit_Inherited_Declaration);
   pragma Convention (C, Declaration_Origins);  -- a_nodes.h:401

   type Mode_Kinds is 
     (Not_A_Mode,
      A_Default_In_Mode,
      An_In_Mode,
      An_Out_Mode,
      An_In_Out_Mode);
   pragma Convention (C, Mode_Kinds);  -- a_nodes.h:417

   type Subprogram_Default_Kinds is 
     (Not_A_Default,
      A_Name_Default,
      A_Box_Default,
      A_Null_Default,
      A_Nil_Default);
   pragma Convention (C, Subprogram_Default_Kinds);  -- a_nodes.h:427

   type Declaration_Struct is record
      Declaration_Kind : aliased Declaration_Kinds;  -- a_nodes.h:440
      Declaration_Origin : aliased Declaration_Origins;  -- a_nodes.h:441
      Corresponding_Pragmas : aliased Pragma_Element_ID_List;  -- a_nodes.h:442
      Names : aliased Defining_Name_List;  -- a_nodes.h:443
      Aspect_Specifications : aliased Element_ID_List;  -- a_nodes.h:444
      Corresponding_Representation_Clauses : aliased Representation_Clause_List;  -- a_nodes.h:445
      Has_Abstract : aliased Extensions.bool;  -- a_nodes.h:455
      Has_Aliased : aliased Extensions.bool;  -- a_nodes.h:462
      Has_Limited : aliased Extensions.bool;  -- a_nodes.h:466
      Has_Private : aliased Extensions.bool;  -- a_nodes.h:469
      Has_Protected : aliased Extensions.bool;  -- a_nodes.h:474
      Has_Reverse : aliased Extensions.bool;  -- a_nodes.h:478
      Has_Task : aliased Extensions.bool;  -- a_nodes.h:483
      Has_Null_Exclusion : aliased Extensions.bool;  -- a_nodes.h:487
      Is_Not_Null_Return : aliased Extensions.bool;  -- a_nodes.h:495
      Mode_Kind : aliased Mode_Kinds;  -- a_nodes.h:498
      Default_Kind : aliased Subprogram_Default_Kinds;  -- a_nodes.h:501
      Pragmas : aliased Pragma_Element_ID_List;  -- a_nodes.h:521
      Corresponding_End_Name : aliased Element_ID;  -- a_nodes.h:534
      Discriminant_Part : aliased Definition_ID;  -- a_nodes.h:543
      Type_Declaration_View : aliased Definition_ID;  -- a_nodes.h:550
      Object_Declaration_View : aliased Definition_ID;  -- a_nodes.h:562
      Initialization_Expression : aliased Expression_ID;  -- a_nodes.h:572
      Corresponding_Type_Declaration : aliased Declaration_ID;  -- a_nodes.h:580
      Corresponding_Type_Completion : aliased Declaration_ID;  -- a_nodes.h:585
      Corresponding_Type_Partial_View : aliased Declaration_ID;  -- a_nodes.h:591
      Corresponding_First_Subtype : aliased Declaration_ID;  -- a_nodes.h:599
      Corresponding_Last_Constraint : aliased Declaration_ID;  -- a_nodes.h:600
      Corresponding_Last_Subtype : aliased Declaration_ID;  -- a_nodes.h:601
      Specification_Subtype_Definition : aliased Discrete_Subtype_Definition_ID;  -- a_nodes.h:604
      Iteration_Scheme_Name : aliased Element_ID;  -- a_nodes.h:607
      Subtype_Indication : aliased Element_ID;  -- a_nodes.h:609
      Parameter_Profile : aliased Parameter_Specification_List;  -- a_nodes.h:626
      Result_Profile : aliased Element_ID;  -- a_nodes.h:634
      Result_Expression : aliased Expression_ID;  -- a_nodes.h:636
      Is_Overriding_Declaration : aliased Extensions.bool;  -- a_nodes.h:652
      Is_Not_Overriding_Declaration : aliased Extensions.bool;  -- a_nodes.h:653
      Body_Declarative_Items : aliased Element_ID_List;  -- a_nodes.h:659
      Body_Statements : aliased Statement_List;  -- a_nodes.h:660
      Body_Exception_Handlers : aliased Exception_Handler_List;  -- a_nodes.h:661
      Body_Block_Statement : aliased Declaration_ID;  -- a_nodes.h:662
      Is_Name_Repeated : aliased Extensions.bool;  -- a_nodes.h:675
      Corresponding_Declaration : aliased Declaration_ID;  -- a_nodes.h:711
      Corresponding_Body : aliased Declaration_ID;  -- a_nodes.h:727
      Corresponding_Subprogram_Derivation : aliased Declaration_ID;  -- a_nodes.h:730
      Corresponding_Type : aliased Type_Definition_ID;  -- a_nodes.h:734
      Corresponding_Equality_Operator : aliased Declaration_ID;  -- a_nodes.h:736
      Visible_Part_Declarative_Items : aliased Declarative_Item_List;  -- a_nodes.h:739
      Is_Private_Present : aliased Extensions.bool;  -- a_nodes.h:740
      Private_Part_Declarative_Items : aliased Declarative_Item_List;  -- a_nodes.h:741
      Declaration_Interface_List : aliased Expression_List;  -- a_nodes.h:746
      Renamed_Entity : aliased Expression_ID;  -- a_nodes.h:755
      Corresponding_Base_Entity : aliased Expression_ID;  -- a_nodes.h:756
      Protected_Operation_Items : aliased Declaration_List;  -- a_nodes.h:758
      Entry_Family_Definition : aliased Discrete_Subtype_Definition_ID;  -- a_nodes.h:760
      Entry_Index_Specification : aliased Declaration_ID;  -- a_nodes.h:762
      Entry_Barrier : aliased Expression_ID;  -- a_nodes.h:763
      Corresponding_Subunit : aliased Declaration_ID;  -- a_nodes.h:769
      Is_Subunit : aliased Extensions.bool;  -- a_nodes.h:775
      Corresponding_Body_Stub : aliased Declaration_ID;  -- a_nodes.h:776
      Generic_Formal_Part : aliased Element_ID_List;  -- a_nodes.h:780
      Generic_Unit_Name : aliased Expression_ID;  -- a_nodes.h:786
      Generic_Actual_Part : aliased Association_List;  -- a_nodes.h:787
      Formal_Subprogram_Default : aliased Expression_ID;  -- a_nodes.h:790
      Is_Dispatching_Operation : aliased Extensions.bool;  -- a_nodes.h:801
   end record;
   pragma Convention (C_Pass_By_Copy, Declaration_Struct);  -- a_nodes.h:439

   type Definition_Kinds is 
     (Not_A_Definition,
      A_Type_Definition,
      A_Subtype_Indication,
      A_Constraint,
      A_Component_Definition,
      A_Discrete_Subtype_Definition,
      A_Discrete_Range,
      An_Unknown_Discriminant_Part,
      A_Known_Discriminant_Part,
      A_Record_Definition,
      A_Null_Record_Definition,
      A_Null_Component,
      A_Variant_Part,
      A_Variant,
      An_Others_Choice,
      An_Access_Definition,
      A_Private_Type_Definition,
      A_Tagged_Private_Type_Definition,
      A_Private_Extension_Definition,
      A_Task_Definition,
      A_Protected_Definition,
      A_Formal_Type_Definition,
      An_Aspect_Specification);
   pragma Convention (C, Definition_Kinds);  -- a_nodes.h:812

   type u_Type_Kinds is 
     (Not_A_Type_Definition,
      A_Derived_Type_Definition,
      A_Derived_Record_Extension_Definition,
      An_Enumeration_Type_Definition,
      A_Signed_Integer_Type_Definition,
      A_Modular_Type_Definition,
      A_Root_Type_Definition,
      A_Floating_Point_Definition,
      An_Ordinary_Fixed_Point_Definition,
      A_Decimal_Fixed_Point_Definition,
      An_Unconstrained_Array_Definition,
      A_Constrained_Array_Definition,
      A_Record_Type_Definition,
      A_Tagged_Record_Type_Definition,
      An_Interface_Type_Definition,
      An_Access_Type_Definition);
   pragma Convention (C, u_Type_Kinds);  -- a_nodes.h:845

   subtype Type_Kinds is u_Type_Kinds;

   type u_Constraint_Kinds is 
     (Not_A_Constraint,
      A_Range_Attribute_Reference,
      A_Simple_Expression_Range,
      A_Digits_Constraint,
      A_Delta_Constraint,
      An_Index_Constraint,
      A_Discriminant_Constraint);
   pragma Convention (C, u_Constraint_Kinds);  -- a_nodes.h:869

   subtype Constraint_Kinds is u_Constraint_Kinds;

   type u_Interface_Kinds is 
     (Not_An_Interface,
      An_Ordinary_Interface,
      A_Limited_Interface,
      A_Task_Interface,
      A_Protected_Interface,
      A_Synchronized_Interface);
   pragma Convention (C, u_Interface_Kinds);  -- a_nodes.h:879

   subtype Interface_Kinds is u_Interface_Kinds;

   type u_Root_Type_Kinds is 
     (Not_A_Root_Type_Definition,
      A_Root_Integer_Definition,
      A_Root_Real_Definition,
      A_Universal_Integer_Definition,
      A_Universal_Real_Definition,
      A_Universal_Fixed_Definition);
   pragma Convention (C, u_Root_Type_Kinds);  -- a_nodes.h:888

   subtype Root_Type_Kinds is u_Root_Type_Kinds;

   type u_Discrete_Range_Kinds is 
     (Not_A_Discrete_Range,
      A_Discrete_Subtype_Indication,
      A_Discrete_Range_Attribute_Reference,
      A_Discrete_Simple_Expression_Range);
   pragma Convention (C, u_Discrete_Range_Kinds);  -- a_nodes.h:897

   subtype Discrete_Range_Kinds is u_Discrete_Range_Kinds;

   type u_Formal_Type_Kinds is 
     (Not_A_Formal_Type_Definition,
      A_Formal_Private_Type_Definition,
      A_Formal_Tagged_Private_Type_Definition,
      A_Formal_Derived_Type_Definition,
      A_Formal_Discrete_Type_Definition,
      A_Formal_Signed_Integer_Type_Definition,
      A_Formal_Modular_Type_Definition,
      A_Formal_Floating_Point_Definition,
      A_Formal_Ordinary_Fixed_Point_Definition,
      A_Formal_Decimal_Fixed_Point_Definition,
      A_Formal_Interface_Type_Definition,
      A_Formal_Unconstrained_Array_Definition,
      A_Formal_Constrained_Array_Definition,
      A_Formal_Access_Type_Definition);
   pragma Convention (C, u_Formal_Type_Kinds);  -- a_nodes.h:904

   subtype Formal_Type_Kinds is u_Formal_Type_Kinds;

   type u_Access_Type_Kinds is 
     (Not_An_Access_Type_Definition,
      A_Pool_Specific_Access_To_Variable,
      An_Access_To_Variable,
      An_Access_To_Constant,
      An_Access_To_Procedure,
      An_Access_To_Protected_Procedure,
      An_Access_To_Function,
      An_Access_To_Protected_Function);
   pragma Convention (C, u_Access_Type_Kinds);  -- a_nodes.h:926

   subtype Access_Type_Kinds is u_Access_Type_Kinds;

   type u_Access_Definition_Kinds is 
     (Not_An_Access_Definition,
      An_Anonymous_Access_To_Variable,
      An_Anonymous_Access_To_Constant,
      An_Anonymous_Access_To_Procedure,
      An_Anonymous_Access_To_Protected_Procedure,
      An_Anonymous_Access_To_Function,
      An_Anonymous_Access_To_Protected_Function);
   pragma Convention (C, u_Access_Definition_Kinds);  -- a_nodes.h:937

   subtype Access_Definition_Kinds is u_Access_Definition_Kinds;

   type u_Access_Type_Struct is record
      Access_Type_Kind : aliased Access_Type_Kinds;  -- a_nodes.h:948
      Has_Null_Exclusion : aliased Extensions.bool;  -- a_nodes.h:949
      Is_Not_Null_Return : aliased Extensions.bool;  -- a_nodes.h:953
      Access_To_Object_Definition : aliased Subtype_Indication;  -- a_nodes.h:957
      Access_To_Subprogram_Parameter_Profile : aliased Parameter_Specification_List;  -- a_nodes.h:962
      Access_To_Function_Result_Profile : aliased Element_ID;  -- a_nodes.h:965
   end record;
   pragma Convention (C_Pass_By_Copy, u_Access_Type_Struct);  -- a_nodes.h:947

   subtype Access_Type_Struct is u_Access_Type_Struct;

   type u_Type_Definition_Struct is record
      Type_Kind : aliased Type_Kinds;  -- a_nodes.h:969
      Has_Abstract : aliased Extensions.bool;  -- a_nodes.h:970
      Has_Limited : aliased Extensions.bool;  -- a_nodes.h:971
      Has_Private : aliased Extensions.bool;  -- a_nodes.h:972
      Corresponding_Type_Operators : aliased Declaration_List;  -- a_nodes.h:973
      Has_Protected : aliased Extensions.bool;  -- a_nodes.h:976
      Has_Synchronized : aliased Extensions.bool;  -- a_nodes.h:977
      Has_Tagged : aliased Extensions.bool;  -- a_nodes.h:979
      Has_Task : aliased Extensions.bool;  -- a_nodes.h:981
      Has_Null_Exclusion : aliased Extensions.bool;  -- a_nodes.h:986
      Interface_Kind : aliased Interface_Kinds;  -- a_nodes.h:988
      Root_Type_Kind : aliased Root_Type_Kinds;  -- a_nodes.h:990
      Parent_Subtype_Indication : aliased Subtype_Indication;  -- a_nodes.h:993
      Record_Definition : aliased Definition;  -- a_nodes.h:997
      Implicit_Inherited_Declarations : aliased Declaration_List;  -- a_nodes.h:1000
      Implicit_Inherited_Subprograms : aliased Declaration_List;  -- a_nodes.h:1001
      Corresponding_Parent_Subtype : aliased Declaration;  -- a_nodes.h:1002
      Corresponding_Root_Type : aliased Declaration;  -- a_nodes.h:1003
      Corresponding_Type_Structure : aliased Declaration;  -- a_nodes.h:1004
      Enumeration_Literal_Declarations : aliased Declaration_List;  -- a_nodes.h:1006
      Integer_Constraint : aliased Range_Constraint;  -- a_nodes.h:1008
      Mod_Static_Expression : aliased Expression;  -- a_nodes.h:1010
      Digits_Expression : aliased Expression;  -- a_nodes.h:1013
      Delta_Expression : aliased Expression;  -- a_nodes.h:1016
      Real_Range_Constraint : aliased Range_Constraint;  -- a_nodes.h:1020
      Index_Subtype_Definitions : aliased Expression_List;  -- a_nodes.h:1022
      Discrete_Subtype_Definitions : aliased Expression_List;  -- a_nodes.h:1024
      Array_Component_Definition : aliased Component_Definition;  -- a_nodes.h:1027
      Definition_Interface_List : aliased Expression_List;  -- a_nodes.h:1030
      Access_Type : aliased Access_Type_Struct;  -- a_nodes.h:1032
   end record;
   pragma Convention (C_Pass_By_Copy, u_Type_Definition_Struct);  -- a_nodes.h:968

   subtype Type_Definition_Struct is u_Type_Definition_Struct;

   type u_Subtype_Indication_Struct is record
      Has_Null_Exclusion : aliased Extensions.bool;  -- a_nodes.h:1036
      Subtype_Mark : aliased Expression;  -- a_nodes.h:1037
      Subtype_Constraint : aliased Constraint;  -- a_nodes.h:1038
   end record;
   pragma Convention (C_Pass_By_Copy, u_Subtype_Indication_Struct);  -- a_nodes.h:1035

   subtype Subtype_Indication_Struct is u_Subtype_Indication_Struct;

   type u_Constraint_Struct is record
      Constraint_Kind : aliased Constraint_Kinds;  -- a_nodes.h:1042
      Digits_Expression : aliased Expression;  -- a_nodes.h:1045
      Delta_Expression : aliased Expression;  -- a_nodes.h:1047
      Real_Range_Constraint : aliased Range_Constraint;  -- a_nodes.h:1050
      Lower_Bound : aliased Expression;  -- a_nodes.h:1052
      Upper_Bound : aliased Expression;  -- a_nodes.h:1053
      Range_Attribute : aliased Expression;  -- a_nodes.h:1055
      Discrete_Ranges : aliased Discrete_Range_List;  -- a_nodes.h:1057
      Discriminant_Associations : aliased Discriminant_Association_List;  -- a_nodes.h:1059
   end record;
   pragma Convention (C_Pass_By_Copy, u_Constraint_Struct);  -- a_nodes.h:1041

   subtype Constraint_Struct is u_Constraint_Struct;

   type u_Component_Definition_Struct is record
      Component_Definition_View : aliased Definition;  -- a_nodes.h:1063
   end record;
   pragma Convention (C_Pass_By_Copy, u_Component_Definition_Struct);  -- a_nodes.h:1062

   subtype Component_Definition_Struct is u_Component_Definition_Struct;

   type u_Discrete_Subtype_Definition_Struct is record
      Discrete_Range_Kind : aliased Discrete_Range_Kinds;  -- a_nodes.h:1067
      Subtype_Mark : aliased Expression;  -- a_nodes.h:1070
      Subtype_Constraint : aliased Constraint;  -- a_nodes.h:1071
   end record;
   pragma Convention (C_Pass_By_Copy, u_Discrete_Subtype_Definition_Struct);  -- a_nodes.h:1066

   subtype Discrete_Subtype_Definition_Struct is u_Discrete_Subtype_Definition_Struct;

   type u_Discrete_Range_Struct is record
      Discrete_Range_Kind : aliased Discrete_Range_Kinds;  -- a_nodes.h:1075
      Subtype_Mark : aliased Expression;  -- a_nodes.h:1078
      Subtype_Constraint : aliased Constraint;  -- a_nodes.h:1079
      Lower_Bound : aliased Expression;  -- a_nodes.h:1081
      Upper_Bound : aliased Expression;  -- a_nodes.h:1082
      Range_Attribute : aliased Expression;  -- a_nodes.h:1084
   end record;
   pragma Convention (C_Pass_By_Copy, u_Discrete_Range_Struct);  -- a_nodes.h:1074

   subtype Discrete_Range_Struct is u_Discrete_Range_Struct;

   type u_Known_Discriminant_Part_Struct is record
      Discriminants : aliased Discriminant_Specification_List;  -- a_nodes.h:1088
   end record;
   pragma Convention (C_Pass_By_Copy, u_Known_Discriminant_Part_Struct);  -- a_nodes.h:1087

   subtype Known_Discriminant_Part_Struct is u_Known_Discriminant_Part_Struct;

   type u_Record_Definition_Struct is record
      Record_Components : aliased Record_Component_List;  -- a_nodes.h:1092
      Implicit_Components : aliased Record_Component_List;  -- a_nodes.h:1093
   end record;
   pragma Convention (C_Pass_By_Copy, u_Record_Definition_Struct);  -- a_nodes.h:1091

   subtype Record_Definition_Struct is u_Record_Definition_Struct;

   type u_Variant_Part_Struct is record
      Discriminant_Direct_Name : aliased Name;  -- a_nodes.h:1097
      Variants : aliased Variant_List;  -- a_nodes.h:1098
   end record;
   pragma Convention (C_Pass_By_Copy, u_Variant_Part_Struct);  -- a_nodes.h:1096

   subtype Variant_Part_Struct is u_Variant_Part_Struct;

   type u_Variant_Struct is record
      Record_Components : aliased Record_Component_List;  -- a_nodes.h:1102
      Implicit_Components : aliased Record_Component_List;  -- a_nodes.h:1103
      Variant_Choices : aliased Element_ID_List;  -- a_nodes.h:1104
   end record;
   pragma Convention (C_Pass_By_Copy, u_Variant_Struct);  -- a_nodes.h:1101

   subtype Variant_Struct is u_Variant_Struct;

   type u_Access_Definition_Struct is record
      Access_Definition_Kind : aliased Access_Definition_Kinds;  -- a_nodes.h:1108
      Has_Null_Exclusion : aliased Extensions.bool;  -- a_nodes.h:1109
      Is_Not_Null_Return : aliased Extensions.bool;  -- a_nodes.h:1113
      Anonymous_Access_To_Object_Subtype_Mark : aliased Expression;  -- a_nodes.h:1116
      Access_To_Subprogram_Parameter_Profile : aliased Parameter_Specification_List;  -- a_nodes.h:1121
      Access_To_Function_Result_Profile : aliased Element_ID;  -- a_nodes.h:1124
   end record;
   pragma Convention (C_Pass_By_Copy, u_Access_Definition_Struct);  -- a_nodes.h:1107

   subtype Access_Definition_Struct is u_Access_Definition_Struct;

   type u_Private_Type_Definition_Struct is record
      Has_Abstract : aliased Extensions.bool;  -- a_nodes.h:1128
      Has_Limited : aliased Extensions.bool;  -- a_nodes.h:1129
      Has_Private : aliased Extensions.bool;  -- a_nodes.h:1130
   end record;
   pragma Convention (C_Pass_By_Copy, u_Private_Type_Definition_Struct);  -- a_nodes.h:1127

   subtype Private_Type_Definition_Struct is u_Private_Type_Definition_Struct;

   type u_Tagged_Private_Type_Definition_Struct is record
      Has_Abstract : aliased Extensions.bool;  -- a_nodes.h:1134
      Has_Limited : aliased Extensions.bool;  -- a_nodes.h:1135
      Has_Private : aliased Extensions.bool;  -- a_nodes.h:1136
      Has_Tagged : aliased Extensions.bool;  -- a_nodes.h:1137
   end record;
   pragma Convention (C_Pass_By_Copy, u_Tagged_Private_Type_Definition_Struct);  -- a_nodes.h:1133

   subtype Tagged_Private_Type_Definition_Struct is u_Tagged_Private_Type_Definition_Struct;

   type u_Private_Extension_Definition_Struct is record
      Has_Abstract : aliased Extensions.bool;  -- a_nodes.h:1141
      Has_Limited : aliased Extensions.bool;  -- a_nodes.h:1142
      Has_Private : aliased Extensions.bool;  -- a_nodes.h:1143
      Has_Synchronized : aliased Extensions.bool;  -- a_nodes.h:1144
      Implicit_Inherited_Declarations : aliased Declaration_List;  -- a_nodes.h:1145
      Implicit_Inherited_Subprograms : aliased Declaration_List;  -- a_nodes.h:1146
      Definition_Interface_List : aliased Expression_List;  -- a_nodes.h:1147
      Ancestor_Subtype_Indication : aliased Subtype_Indication;  -- a_nodes.h:1148
   end record;
   pragma Convention (C_Pass_By_Copy, u_Private_Extension_Definition_Struct);  -- a_nodes.h:1140

   subtype Private_Extension_Definition_Struct is u_Private_Extension_Definition_Struct;

   type u_Task_Definition_Struct is record
      Has_Task : aliased Extensions.bool;  -- a_nodes.h:1152
      Visible_Part_Items : aliased Declarative_Item_List;  -- a_nodes.h:1153
      Private_Part_Items : aliased Declarative_Item_List;  -- a_nodes.h:1154
      Is_Private_Present : aliased Extensions.bool;  -- a_nodes.h:1155
   end record;
   pragma Convention (C_Pass_By_Copy, u_Task_Definition_Struct);  -- a_nodes.h:1151

   subtype Task_Definition_Struct is u_Task_Definition_Struct;

   type u_Protected_Definition_Struct is record
      Has_Protected : aliased Extensions.bool;  -- a_nodes.h:1159
      Visible_Part_Items : aliased Declarative_Item_List;  -- a_nodes.h:1160
      Private_Part_Items : aliased Declarative_Item_List;  -- a_nodes.h:1161
      Is_Private_Present : aliased Extensions.bool;  -- a_nodes.h:1162
   end record;
   pragma Convention (C_Pass_By_Copy, u_Protected_Definition_Struct);  -- a_nodes.h:1158

   subtype Protected_Definition_Struct is u_Protected_Definition_Struct;

   type u_Formal_Type_Definition_Struct is record
      Formal_Type_Kind : aliased Formal_Type_Kinds;  -- a_nodes.h:1166
      Corresponding_Type_Operators : aliased Declaration_List;  -- a_nodes.h:1167
      Has_Abstract : aliased Extensions.bool;  -- a_nodes.h:1172
      Has_Limited : aliased Extensions.bool;  -- a_nodes.h:1173
      Has_Private : aliased Extensions.bool;  -- a_nodes.h:1176
      Has_Synchronized : aliased Extensions.bool;  -- a_nodes.h:1178
      Has_Tagged : aliased Extensions.bool;  -- a_nodes.h:1180
      Interface_Kind : aliased Interface_Kinds;  -- a_nodes.h:1182
      Implicit_Inherited_Declarations : aliased Declaration_List;  -- a_nodes.h:1184
      Implicit_Inherited_Subprograms : aliased Declaration_List;  -- a_nodes.h:1185
      Index_Subtype_Definitions : aliased Expression_List;  -- a_nodes.h:1187
      Discrete_Subtype_Definitions : aliased Expression_List;  -- a_nodes.h:1189
      Array_Component_Definition : aliased Component_Definition;  -- a_nodes.h:1192
      Subtype_Mark : aliased Expression;  -- a_nodes.h:1194
      Definition_Interface_List : aliased Expression_List;  -- a_nodes.h:1197
      Access_Type : aliased Access_Type_Struct;  -- a_nodes.h:1199
   end record;
   pragma Convention (C_Pass_By_Copy, u_Formal_Type_Definition_Struct);  -- a_nodes.h:1165

   subtype Formal_Type_Definition_Struct is u_Formal_Type_Definition_Struct;

   type u_Aspect_Specification_Struct is record
      Aspect_Mark : aliased Element_ID;  -- a_nodes.h:1203
      Aspect_Definition : aliased Element_ID;  -- a_nodes.h:1204
   end record;
   pragma Convention (C_Pass_By_Copy, u_Aspect_Specification_Struct);  -- a_nodes.h:1202

   subtype Aspect_Specification_Struct is u_Aspect_Specification_Struct;

   subtype No_Struct is int;  -- a_nodes.h:1207

   subtype Unknown_Discriminant_Part_Struct is No_Struct;  -- a_nodes.h:1208

   subtype Null_Record_Definition_Struct is No_Struct;  -- a_nodes.h:1209

   subtype Null_Component_Struct is No_Struct;  -- a_nodes.h:1210

   subtype Others_Choice_Struct is No_Struct;  -- a_nodes.h:1211

   type u_Definition_Union (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            Dummy_Member : aliased int;  -- a_nodes.h:1214
         when 1 =>
            The_Type_Definition : aliased Type_Definition_Struct;  -- a_nodes.h:1215
         when 2 =>
            The_Subtype_Indication : aliased Subtype_Indication_Struct;  -- a_nodes.h:1216
         when 3 =>
            The_Constraint : aliased Constraint_Struct;  -- a_nodes.h:1217
         when 4 =>
            The_Component_Definition : aliased Component_Definition_Struct;  -- a_nodes.h:1218
         when 5 =>
            The_Discrete_Subtype_Definition : aliased Discrete_Subtype_Definition_Struct;  -- a_nodes.h:1219
         when 6 =>
            The_Discrete_Range : aliased Discrete_Range_Struct;  -- a_nodes.h:1220
         when 7 =>
            The_Unknown_Discriminant_Part : aliased Unknown_Discriminant_Part_Struct;  -- a_nodes.h:1221
         when 8 =>
            The_Known_Discriminant_Part : aliased Known_Discriminant_Part_Struct;  -- a_nodes.h:1222
         when 9 =>
            The_Record_Definition : aliased Record_Definition_Struct;  -- a_nodes.h:1223
         when 10 =>
            The_Null_Record_Definition : aliased Null_Record_Definition_Struct;  -- a_nodes.h:1224
         when 11 =>
            The_Null_Component : aliased Null_Component_Struct;  -- a_nodes.h:1225
         when 12 =>
            The_Variant_Part : aliased Variant_Part_Struct;  -- a_nodes.h:1226
         when 13 =>
            The_Variant : aliased Variant_Struct;  -- a_nodes.h:1227
         when 14 =>
            The_Others_Choice : aliased Others_Choice_Struct;  -- a_nodes.h:1228
         when 15 =>
            The_Access_Definition : aliased Access_Definition_Struct;  -- a_nodes.h:1229
         when 16 =>
            The_Private_Type_Definition : aliased Private_Type_Definition_Struct;  -- a_nodes.h:1230
         when 17 =>
            The_Tagged_Private_Type_Definition : aliased Tagged_Private_Type_Definition_Struct;  -- a_nodes.h:1231
         when 18 =>
            The_Private_Extension_Definition : aliased Private_Extension_Definition_Struct;  -- a_nodes.h:1232
         when 19 =>
            The_Task_Definition : aliased Task_Definition_Struct;  -- a_nodes.h:1233
         when 20 =>
            The_Protected_Definition : aliased Protected_Definition_Struct;  -- a_nodes.h:1234
         when 21 =>
            The_Formal_Type_Definition : aliased Formal_Type_Definition_Struct;  -- a_nodes.h:1235
         when others =>
            The_Aspect_Specification : aliased Aspect_Specification_Struct;  -- a_nodes.h:1236
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, u_Definition_Union);
   pragma Unchecked_Union (u_Definition_Union);  -- a_nodes.h:1213

   subtype Definition_Union is u_Definition_Union;

   type Definition_Struct is record
      Definition_Kind : aliased Definition_Kinds;  -- a_nodes.h:1241
      The_Union : aliased Definition_Union;  -- a_nodes.h:1242
   end record;
   pragma Convention (C_Pass_By_Copy, Definition_Struct);  -- a_nodes.h:1240

   type Expression_Kinds is 
     (Not_An_Expression,
      A_Box_Expression,
      An_Integer_Literal,
      A_Real_Literal,
      A_String_Literal,
      An_Identifier,
      An_Operator_Symbol,
      A_Character_Literal,
      An_Enumeration_Literal,
      An_Explicit_Dereference,
      A_Function_Call,
      An_Indexed_Component,
      A_Slice,
      A_Selected_Component,
      An_Attribute_Reference,
      A_Record_Aggregate,
      An_Extension_Aggregate,
      A_Positional_Array_Aggregate,
      A_Named_Array_Aggregate,
      An_And_Then_Short_Circuit,
      An_Or_Else_Short_Circuit,
      An_In_Membership_Test,
      A_Not_In_Membership_Test,
      A_Null_Literal,
      A_Parenthesized_Expression,
      A_Raise_Expression,
      A_Type_Conversion,
      A_Qualified_Expression,
      An_Allocation_From_Subtype,
      An_Allocation_From_Qualified_Expression,
      A_Case_Expression,
      An_If_Expression,
      A_For_All_Quantified_Expression,
      A_For_Some_Quantified_Expression);
   pragma Convention (C, Expression_Kinds);  -- a_nodes.h:1253

   type Attribute_Kinds is 
     (Not_An_Attribute,
      An_Access_Attribute,
      An_Address_Attribute,
      An_Adjacent_Attribute,
      An_Aft_Attribute,
      An_Alignment_Attribute,
      A_Base_Attribute,
      A_Bit_Order_Attribute,
      A_Body_Version_Attribute,
      A_Callable_Attribute,
      A_Caller_Attribute,
      A_Ceiling_Attribute,
      A_Class_Attribute,
      A_Component_Size_Attribute,
      A_Compose_Attribute,
      A_Constrained_Attribute,
      A_Copy_Sign_Attribute,
      A_Count_Attribute,
      A_Definite_Attribute,
      A_Delta_Attribute,
      A_Denorm_Attribute,
      A_Digits_Attribute,
      An_Exponent_Attribute,
      An_External_Tag_Attribute,
      A_First_Attribute,
      A_First_Bit_Attribute,
      A_Floor_Attribute,
      A_Fore_Attribute,
      A_Fraction_Attribute,
      An_Identity_Attribute,
      An_Image_Attribute,
      An_Input_Attribute,
      A_Last_Attribute,
      A_Last_Bit_Attribute,
      A_Leading_Part_Attribute,
      A_Length_Attribute,
      A_Machine_Attribute,
      A_Machine_Emax_Attribute,
      A_Machine_Emin_Attribute,
      A_Machine_Mantissa_Attribute,
      A_Machine_Overflows_Attribute,
      A_Machine_Radix_Attribute,
      A_Machine_Rounds_Attribute,
      A_Max_Attribute,
      A_Max_Size_In_Storage_Elements_Attribute,
      A_Min_Attribute,
      A_Model_Attribute,
      A_Model_Emin_Attribute,
      A_Model_Epsilon_Attribute,
      A_Model_Mantissa_Attribute,
      A_Model_Small_Attribute,
      A_Modulus_Attribute,
      An_Output_Attribute,
      A_Partition_ID_Attribute,
      A_Pos_Attribute,
      A_Position_Attribute,
      A_Pred_Attribute,
      A_Range_Attribute,
      A_Read_Attribute,
      A_Remainder_Attribute,
      A_Round_Attribute,
      A_Rounding_Attribute,
      A_Safe_First_Attribute,
      A_Safe_Last_Attribute,
      A_Scale_Attribute,
      A_Scaling_Attribute,
      A_Signed_Zeros_Attribute,
      A_Size_Attribute,
      A_Small_Attribute,
      A_Storage_Pool_Attribute,
      A_Storage_Size_Attribute,
      A_Succ_Attribute,
      A_Tag_Attribute,
      A_Terminated_Attribute,
      A_Truncation_Attribute,
      An_Unbiased_Rounding_Attribute,
      An_Unchecked_Access_Attribute,
      A_Val_Attribute,
      A_Valid_Attribute,
      A_Value_Attribute,
      A_Version_Attribute,
      A_Wide_Image_Attribute,
      A_Wide_Value_Attribute,
      A_Wide_Width_Attribute,
      A_Width_Attribute,
      A_Write_Attribute,
      A_Machine_Rounding_Attribute,
      A_Mod_Attribute,
      A_Priority_Attribute,
      A_Stream_Size_Attribute,
      A_Wide_Wide_Image_Attribute,
      A_Wide_Wide_Value_Attribute,
      A_Wide_Wide_Width_Attribute,
      A_Max_Alignment_For_Allocation_Attribute,
      An_Overlaps_Storage_Attribute,
      An_Implementation_Defined_Attribute,
      An_Unknown_Attribute);
   pragma Convention (C, Attribute_Kinds);  -- a_nodes.h:1298

   type Expression_Struct is record
      Expression_Kind : aliased Expression_Kinds;  -- a_nodes.h:1411
      Is_Prefix_Notation : aliased Extensions.bool;  -- a_nodes.h:1412
      Corresponding_Expression_Type : aliased Declaration_ID;  -- a_nodes.h:1413
      Corresponding_Expression_Type_Definition : aliased Element_ID;  -- a_nodes.h:1414
      Operator_Kind : aliased Operator_Kinds;  -- a_nodes.h:1418
      Attribute_Kind : aliased Attribute_Kinds;  -- a_nodes.h:1423
      Value_Image : Interfaces.C.Strings.chars_ptr;  -- a_nodes.h:1424
      Name_Image : Interfaces.C.Strings.chars_ptr;  -- a_nodes.h:1429
      Corresponding_Name_Definition : aliased Defining_Name_ID;  -- a_nodes.h:1430
      Corresponding_Name_Definition_List : aliased Defining_Name_List;  -- a_nodes.h:1431
      Corresponding_Name_Declaration : aliased Element_ID;  -- a_nodes.h:1432
      Prefix : aliased Expression_ID;  -- a_nodes.h:1439
      Index_Expressions : aliased Expression_List;  -- a_nodes.h:1441
      Slice_Range : aliased Discrete_Range_ID;  -- a_nodes.h:1443
      Selector : aliased Expression_ID;  -- a_nodes.h:1445
      Attribute_Designator_Identifier : aliased Expression_ID;  -- a_nodes.h:1447
      Attribute_Designator_Expressions : aliased Expression_List;  -- a_nodes.h:1456
      Record_Component_Associations : aliased Association_List;  -- a_nodes.h:1459
      Extension_Aggregate_Expression : aliased Expression_ID;  -- a_nodes.h:1461
      Array_Component_Associations : aliased Association_List;  -- a_nodes.h:1464
      Expression_Parenthesized : aliased Expression_ID;  -- a_nodes.h:1466
      Is_Prefix_Call : aliased Extensions.bool;  -- a_nodes.h:1468
      Corresponding_Called_Function : aliased Declaration_ID;  -- a_nodes.h:1471
      Function_Call_Parameters : aliased Element_ID_List;  -- a_nodes.h:1473
      Short_Circuit_Operation_Left_Expression : aliased Expression_ID;  -- a_nodes.h:1476
      Short_Circuit_Operation_Right_Expression : aliased Expression_ID;  -- a_nodes.h:1477
      Membership_Test_Expression : aliased Expression_ID;  -- a_nodes.h:1480
      Membership_Test_Choices : aliased Element_ID_List;  -- a_nodes.h:1481
      Converted_Or_Qualified_Subtype_Mark : aliased Expression_ID;  -- a_nodes.h:1484
      Converted_Or_Qualified_Expression : aliased Expression_ID;  -- a_nodes.h:1485
      Allocator_Subtype_Indication : aliased Subtype_Indication_ID;  -- a_nodes.h:1487
      Allocator_Qualified_Expression : aliased Expression_ID;  -- a_nodes.h:1489
      Expression_Paths : aliased Expression_Path_List;  -- a_nodes.h:1492
      Is_Generalized_Indexing : aliased Extensions.bool;  -- a_nodes.h:1494
      Is_Generalized_Reference : aliased Extensions.bool;  -- a_nodes.h:1496
      Iterator_Specification : aliased Declaration_ID;  -- a_nodes.h:1499
      Predicate : aliased Expression_ID;  -- a_nodes.h:1502
      Subpool_Name : aliased Expression_ID;  -- a_nodes.h:1505
      Corresponding_Generic_Element : aliased Defining_Name_ID;  -- a_nodes.h:1510
      Is_Dispatching_Call : aliased Extensions.bool;  -- a_nodes.h:1512
      Is_Call_On_Dispatching_Operation : aliased Extensions.bool;  -- a_nodes.h:1513
   end record;
   pragma Convention (C_Pass_By_Copy, Expression_Struct);  -- a_nodes.h:1410

   type Association_Kinds is 
     (Not_An_Association,
      A_Pragma_Argument_Association,
      A_Discriminant_Association,
      A_Record_Component_Association,
      An_Array_Component_Association,
      A_Parameter_Association,
      A_Generic_Association);
   pragma Convention (C, Association_Kinds);  -- a_nodes.h:1524

   type Association_Struct is record
      Association_Kind : aliased Association_Kinds;  -- a_nodes.h:1537
      Array_Component_Choices : aliased Expression_List;  -- a_nodes.h:1540
      Record_Component_Choices : aliased Expression_List;  -- a_nodes.h:1542
      Component_Expression : aliased Expression_ID;  -- a_nodes.h:1545
      Formal_Parameter : aliased Expression_ID;  -- a_nodes.h:1549
      Actual_Parameter : aliased Expression_ID;  -- a_nodes.h:1550
      Discriminant_Selector_Names : aliased Expression_List;  -- a_nodes.h:1552
      Discriminant_Expression : aliased Expression_ID;  -- a_nodes.h:1553
      Is_Normalized : aliased Extensions.bool;  -- a_nodes.h:1558
      Is_Defaulted_Association : aliased Extensions.bool;  -- a_nodes.h:1562
   end record;
   pragma Convention (C_Pass_By_Copy, Association_Struct);  -- a_nodes.h:1536

   type Statement_Kinds is 
     (Not_A_Statement,
      A_Null_Statement,
      An_Assignment_Statement,
      An_If_Statement,
      A_Case_Statement,
      A_Loop_Statement,
      A_While_Loop_Statement,
      A_For_Loop_Statement,
      A_Block_Statement,
      An_Exit_Statement,
      A_Goto_Statement,
      A_Procedure_Call_Statement,
      A_Return_Statement,
      An_Extended_Return_Statement,
      An_Accept_Statement,
      An_Entry_Call_Statement,
      A_Requeue_Statement,
      A_Requeue_Statement_With_Abort,
      A_Delay_Until_Statement,
      A_Delay_Relative_Statement,
      A_Terminate_Alternative_Statement,
      A_Selective_Accept_Statement,
      A_Timed_Entry_Call_Statement,
      A_Conditional_Entry_Call_Statement,
      An_Asynchronous_Select_Statement,
      An_Abort_Statement,
      A_Raise_Statement,
      A_Code_Statement);
   pragma Convention (C, Statement_Kinds);  -- a_nodes.h:1573

   type Statement_Struct is record
      Statement_Kind : aliased Statement_Kinds;  -- a_nodes.h:1610
      Corresponding_Pragmas : aliased Pragma_Element_ID_List;  -- a_nodes.h:1611
      Label_Names : aliased Defining_Name_List;  -- a_nodes.h:1612
      Is_Prefix_Notation : aliased Extensions.bool;  -- a_nodes.h:1616
      Pragmas : aliased Pragma_Element_ID_List;  -- a_nodes.h:1623
      Corresponding_End_Name : aliased Element_ID;  -- a_nodes.h:1629
      Assignment_Variable_Name : aliased Expression_ID;  -- a_nodes.h:1631
      Assignment_Expression : aliased Expression_ID;  -- a_nodes.h:1632
      Statement_Paths : aliased Path_List;  -- a_nodes.h:1639
      Case_Expression : aliased Expression_ID;  -- a_nodes.h:1641
      Statement_Identifier : aliased Defining_Name_ID;  -- a_nodes.h:1646
      Is_Name_Repeated : aliased Extensions.bool;  -- a_nodes.h:1650
      While_Condition : aliased Expression_ID;  -- a_nodes.h:1652
      For_Loop_Parameter_Specification : aliased Declaration_ID;  -- a_nodes.h:1654
      Loop_Statements : aliased Statement_List;  -- a_nodes.h:1658
      Is_Declare_Block : aliased Extensions.bool;  -- a_nodes.h:1660
      Block_Declarative_Items : aliased Declarative_Item_List;  -- a_nodes.h:1661
      Block_Statements : aliased Statement_List;  -- a_nodes.h:1662
      Block_Exception_Handlers : aliased Exception_Handler_List;  -- a_nodes.h:1663
      Exit_Loop_Name : aliased Expression_ID;  -- a_nodes.h:1665
      Exit_Condition : aliased Expression_ID;  -- a_nodes.h:1666
      Corresponding_Loop_Exited : aliased Expression_ID;  -- a_nodes.h:1667
      Return_Expression : aliased Expression_ID;  -- a_nodes.h:1669
      Return_Object_Declaration : aliased Declaration_ID;  -- a_nodes.h:1672
      Extended_Return_Statements : aliased Statement_List;  -- a_nodes.h:1673
      Extended_Return_Exception_Handlers : aliased Exception_Handler_List;  -- a_nodes.h:1674
      Goto_Label : aliased Expression_ID;  -- a_nodes.h:1676
      Corresponding_Destination_Statement : aliased Statement_ID;  -- a_nodes.h:1677
      Called_Name : aliased Expression_ID;  -- a_nodes.h:1680
      Corresponding_Called_Entity : aliased Declaration_ID;  -- a_nodes.h:1681
      Call_Statement_Parameters : aliased Association_List;  -- a_nodes.h:1682
      Accept_Entry_Index : aliased Expression_ID;  -- a_nodes.h:1685
      Accept_Entry_Direct_Name : aliased Name_ID;  -- a_nodes.h:1686
      Accept_Parameters : aliased Parameter_Specification_List;  -- a_nodes.h:1688
      Accept_Body_Statements : aliased Statement_List;  -- a_nodes.h:1689
      Accept_Body_Exception_Handlers : aliased Statement_List;  -- a_nodes.h:1690
      Corresponding_Entry : aliased Declaration_ID;  -- a_nodes.h:1691
      Requeue_Entry_Name : aliased Name_ID;  -- a_nodes.h:1694
      Delay_Expression : aliased Expression_ID;  -- a_nodes.h:1697
      Aborted_Tasks : aliased Expression_List;  -- a_nodes.h:1699
      Raised_Exception : aliased Expression_ID;  -- a_nodes.h:1701
      Associated_Message : aliased Expression_ID;  -- a_nodes.h:1702
      Qualified_Expression : aliased Expression_ID;  -- a_nodes.h:1704
      Is_Dispatching_Call : aliased Extensions.bool;  -- a_nodes.h:1706
      Is_Call_On_Dispatching_Operation : aliased Extensions.bool;  -- a_nodes.h:1707
      Corresponding_Called_Entity_Unwound : aliased Declaration;  -- a_nodes.h:1710
   end record;
   pragma Convention (C_Pass_By_Copy, Statement_Struct);  -- a_nodes.h:1609

   type Path_Kinds is 
     (Not_A_Path,
      An_If_Path,
      An_Elsif_Path,
      An_Else_Path,
      A_Case_Path,
      A_Select_Path,
      An_Or_Path,
      A_Then_Abort_Path,
      A_Case_Expression_Path,
      An_If_Expression_Path,
      An_Elsif_Expression_Path,
      An_Else_Expression_Path);
   pragma Convention (C, Path_Kinds);  -- a_nodes.h:1721

   type Path_Struct is record
      Path_Kind : aliased Path_Kinds;  -- a_nodes.h:1777
      Sequence_Of_Statements : aliased Statement_List;  -- a_nodes.h:1778
      Dependent_Expression : aliased Expression;  -- a_nodes.h:1779
      Condition_Expression : aliased Expression_ID;  -- a_nodes.h:1784
      Case_Path_Alternative_Choices : aliased Element_ID_List;  -- a_nodes.h:1787
      Guard : aliased Expression_ID;  -- a_nodes.h:1790
   end record;
   pragma Convention (C_Pass_By_Copy, Path_Struct);  -- a_nodes.h:1776

   type Clause_Kinds is 
     (Not_A_Clause,
      A_Use_Package_Clause,
      A_Use_Type_Clause,
      A_Use_All_Type_Clause,
      A_With_Clause,
      A_Representation_Clause,
      A_Component_Clause);
   pragma Convention (C, Clause_Kinds);  -- a_nodes.h:1801

   type u_Representation_Clause_Kinds is 
     (Not_A_Representation_Clause,
      An_Attribute_Definition_Clause,
      An_Enumeration_Representation_Clause,
      A_Record_Representation_Clause,
      An_At_Clause);
   pragma Convention (C, u_Representation_Clause_Kinds);  -- a_nodes.h:1813

   subtype Representation_Clause_Kinds is u_Representation_Clause_Kinds;

   type u_Representation_Clause_Struct is record
      Representation_Clause_Kind : aliased Representation_Clause_Kinds;  -- a_nodes.h:1822
      Representation_Clause_Name : aliased Name;  -- a_nodes.h:1823
      Pragmas : aliased Pragma_Element_ID_List;  -- a_nodes.h:1827
      Representation_Clause_Expression : aliased Expression;  -- a_nodes.h:1831
      Mod_Clause_Expression : aliased Expression;  -- a_nodes.h:1833
      Component_Clauses : aliased Component_Clause_List;  -- a_nodes.h:1834
   end record;
   pragma Convention (C_Pass_By_Copy, u_Representation_Clause_Struct);  -- a_nodes.h:1821

   subtype Representation_Clause_Struct is u_Representation_Clause_Struct;

   type Clause_Struct is record
      Clause_Kind : aliased Clause_Kinds;  -- a_nodes.h:1839
      Has_Limited : aliased Extensions.bool;  -- a_nodes.h:1842
      Clause_Names : aliased Name_List;  -- a_nodes.h:1847
      Representation_Clause_Name : aliased Name_ID;  -- a_nodes.h:1849
      Representation_Clause_Expression : aliased Expression_ID;  -- a_nodes.h:1850
      Mod_Clause_Expression : aliased Expression_ID;  -- a_nodes.h:1851
      Component_Clauses : aliased Element_ID_List;  -- a_nodes.h:1852
      Component_Clause_Position : aliased Expression_ID;  -- a_nodes.h:1853
      Component_Clause_Range : aliased Element_ID;  -- a_nodes.h:1854
      Representation_Clause : aliased Representation_Clause_Struct;  -- a_nodes.h:1857
   end record;
   pragma Convention (C_Pass_By_Copy, Clause_Struct);  -- a_nodes.h:1838

   type Exception_Handler_Struct is record
      Pragmas : aliased Pragma_Element_ID_List;  -- a_nodes.h:1873
      Choice_Parameter_Specification : aliased Declaration_ID;  -- a_nodes.h:1874
      Exception_Choices : aliased Element_ID_List;  -- a_nodes.h:1875
      Handler_Statements : aliased Statement_List;  -- a_nodes.h:1876
   end record;
   pragma Convention (C_Pass_By_Copy, Exception_Handler_Struct);  -- a_nodes.h:1872

   type Element_Union (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            Dummy_Member : aliased int;  -- a_nodes.h:1889
         when 1 =>
            The_Pragma : aliased Pragma_Struct;  -- a_nodes.h:1890
         when 2 =>
            Defining_Name : aliased Defining_Name_Struct;  -- a_nodes.h:1891
         when 3 =>
            Declaration : aliased Declaration_Struct;  -- a_nodes.h:1892
         when 4 =>
            Definition : aliased Definition_Struct;  -- a_nodes.h:1893
         when 5 =>
            Expression : aliased Expression_Struct;  -- a_nodes.h:1894
         when 6 =>
            Association : aliased Association_Struct;  -- a_nodes.h:1895
         when 7 =>
            Statement : aliased Statement_Struct;  -- a_nodes.h:1896
         when 8 =>
            Path : aliased Path_Struct;  -- a_nodes.h:1897
         when 9 =>
            Clause : aliased Clause_Struct;  -- a_nodes.h:1898
         when others =>
            Exception_Handler : aliased Exception_Handler_Struct;  -- a_nodes.h:1899
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, Element_Union);
   pragma Unchecked_Union (Element_Union);  -- a_nodes.h:1888

   type Enclosing_Kinds is 
     (Not_Enclosing,
      Enclosing_Element,
      Enclosing_Unit);
   pragma Convention (C, Enclosing_Kinds);  -- a_nodes.h:1902

   type Source_Location_Struct is record
      Unit_Name : Interfaces.C.Strings.chars_ptr;  -- a_nodes.h:1910
      First_Line : aliased int;  -- a_nodes.h:1911
      First_Column : aliased int;  -- a_nodes.h:1912
      Last_Line : aliased int;  -- a_nodes.h:1913
      Last_Column : aliased int;  -- a_nodes.h:1914
   end record;
   pragma Convention (C_Pass_By_Copy, Source_Location_Struct);  -- a_nodes.h:1909

   subtype Unit_ID is Node_ID;  -- a_nodes.h:1918

   type u_Element_Struct is record
      ID : aliased Element_ID;  -- a_nodes.h:1922
      Element_Kind : aliased Element_Kinds;  -- a_nodes.h:1923
      Enclosing_Compilation_Unit : aliased Unit_ID;  -- a_nodes.h:1924
      Is_Part_Of_Implicit : aliased Extensions.bool;  -- a_nodes.h:1925
      Is_Part_Of_Inherited : aliased Extensions.bool;  -- a_nodes.h:1926
      Is_Part_Of_Instance : aliased Extensions.bool;  -- a_nodes.h:1927
      Hash : aliased ASIS_Integer;  -- a_nodes.h:1928
      Enclosing_Element_ID : aliased Element_ID;  -- a_nodes.h:1929
      Enclosing_Kind : aliased Enclosing_Kinds;  -- a_nodes.h:1930
      Source_Location : aliased Source_Location_Struct;  -- a_nodes.h:1931
      Debug_Image : Interfaces.C.Strings.chars_ptr;  -- a_nodes.h:1932
      The_Union : aliased Element_Union;  -- a_nodes.h:1933
   end record;
   pragma Convention (C_Pass_By_Copy, u_Element_Struct);  -- a_nodes.h:1921

   subtype Element_Struct is u_Element_Struct;

   type Unit_ID_Ptr is access all Unit_ID;  -- a_nodes.h:1944

   type Unit_ID_Array_Struct is record
      Length : aliased int;  -- a_nodes.h:1949
      IDs : Unit_ID_Ptr;  -- a_nodes.h:1950
   end record;
   pragma Convention (C_Pass_By_Copy, Unit_ID_Array_Struct);  -- a_nodes.h:1948

   subtype Unit_List is Unit_ID_Array_Struct;

   type Unit_Kinds is 
     (Not_A_Unit,
      A_Procedure,
      A_Function,
      A_Package,
      A_Generic_Procedure,
      A_Generic_Function,
      A_Generic_Package,
      A_Procedure_Instance,
      A_Function_Instance,
      A_Package_Instance,
      A_Procedure_Renaming,
      A_Function_Renaming,
      A_Package_Renaming,
      A_Generic_Procedure_Renaming,
      A_Generic_Function_Renaming,
      A_Generic_Package_Renaming,
      A_Procedure_Body,
      A_Function_Body,
      A_Package_Body,
      A_Procedure_Body_Subunit,
      A_Function_Body_Subunit,
      A_Package_Body_Subunit,
      A_Task_Body_Subunit,
      A_Protected_Body_Subunit,
      A_Nonexistent_Declaration,
      A_Nonexistent_Body,
      A_Configuration_Compilation,
      An_Unknown_Unit);
   pragma Convention (C, Unit_Kinds);  -- a_nodes.h:1954

   type Unit_Classes is 
     (Not_A_Class,
      A_Public_Declaration,
      A_Public_Body,
      A_Public_Declaration_And_Body,
      A_Private_Declaration,
      A_Private_Body,
      A_Separate_Body);
   pragma Convention (C, Unit_Classes);  -- a_nodes.h:2021

   type Unit_Origins is 
     (Not_An_Origin,
      A_Predefined_Unit,
      An_Implementation_Unit,
      An_Application_Unit);
   pragma Convention (C, Unit_Origins);  -- a_nodes.h:2042

   type u_Unit_Struct is record
      ID : aliased Unit_ID;  -- a_nodes.h:2062
      Unit_Kind : aliased Unit_Kinds;  -- a_nodes.h:2063
      Unit_Class : aliased Unit_Classes;  -- a_nodes.h:2064
      Unit_Origin : aliased Unit_Origins;  -- a_nodes.h:2065
      Unit_Full_Name : Interfaces.C.Strings.chars_ptr;  -- a_nodes.h:2066
      Unique_Name : Interfaces.C.Strings.chars_ptr;  -- a_nodes.h:2067
      Exists : aliased Extensions.bool;  -- a_nodes.h:2068
      Can_Be_Main_Program : aliased Extensions.bool;  -- a_nodes.h:2069
      Is_Body_Required : aliased Extensions.bool;  -- a_nodes.h:2070
      Text_Name : Interfaces.C.Strings.chars_ptr;  -- a_nodes.h:2071
      Text_Form : Interfaces.C.Strings.chars_ptr;  -- a_nodes.h:2072
      Object_Name : Interfaces.C.Strings.chars_ptr;  -- a_nodes.h:2073
      Object_Form : Interfaces.C.Strings.chars_ptr;  -- a_nodes.h:2074
      Compilation_Command_Line_Options : Interfaces.C.Strings.chars_ptr;  -- a_nodes.h:2075
      Debug_Image : Interfaces.C.Strings.chars_ptr;  -- a_nodes.h:2076
      Unit_Declaration : aliased Declaration_ID;  -- a_nodes.h:2077
      Context_Clause_Elements : aliased Context_Clause_List;  -- a_nodes.h:2078
      Compilation_Pragmas : aliased Pragma_Element_ID_List;  -- a_nodes.h:2079
      Is_Standard : aliased Extensions.bool;  -- a_nodes.h:2080
      Corresponding_Children : aliased Unit_List;  -- a_nodes.h:2086
      Corresponding_Parent_Declaration : aliased Unit_ID;  -- a_nodes.h:2105
      Corresponding_Declaration : aliased Unit_ID;  -- a_nodes.h:2110
      Corresponding_Body : aliased Unit_ID;  -- a_nodes.h:2118
      Subunits : aliased Unit_List;  -- a_nodes.h:2127
      Corresponding_Subunit_Parent_Body : aliased Unit_ID;  -- a_nodes.h:2133
   end record;
   pragma Convention (C_Pass_By_Copy, u_Unit_Struct);  -- a_nodes.h:2061

   subtype Unit_Struct is u_Unit_Struct;

   type u_Context_Struct is record
      name : Interfaces.C.Strings.chars_ptr;  -- a_nodes.h:2144
      parameters : Interfaces.C.Strings.chars_ptr;  -- a_nodes.h:2145
      debug_image : Interfaces.C.Strings.chars_ptr;  -- a_nodes.h:2146
   end record;
   pragma Convention (C_Pass_By_Copy, u_Context_Struct);  -- a_nodes.h:2143

   subtype Context_Struct is u_Context_Struct;

   type u_Unit_Struct_List_Struct is record
      Unit : aliased Unit_Struct;  -- a_nodes.h:2154
      Next : access u_Unit_Struct_List_Struct;  -- a_nodes.h:2155
      Next_Count : aliased int;  -- a_nodes.h:2156
   end record;
   pragma Convention (C_Pass_By_Copy, u_Unit_Struct_List_Struct);  -- a_nodes.h:2153

   subtype Unit_Struct_List_Struct is u_Unit_Struct_List_Struct;

   type Unit_Structs_Ptr is access all Unit_Struct_List_Struct;  -- a_nodes.h:2159

   type u_Element_Struct_List_Struct is record
      Element : aliased Element_Struct;  -- a_nodes.h:2162
      Next : access u_Element_Struct_List_Struct;  -- a_nodes.h:2163
      Next_Count : aliased int;  -- a_nodes.h:2164
   end record;
   pragma Convention (C_Pass_By_Copy, u_Element_Struct_List_Struct);  -- a_nodes.h:2161

   subtype Element_Struct_List_Struct is u_Element_Struct_List_Struct;

   type Element_Structs_Ptr is access all Element_Struct_List_Struct;  -- a_nodes.h:2167

   type u_Nodes_Struct is record
      Context : aliased Context_Struct;  -- a_nodes.h:2170
      Units : Unit_Structs_Ptr;  -- a_nodes.h:2171
      Elements : Element_Structs_Ptr;  -- a_nodes.h:2172
   end record;
   pragma Convention (C_Pass_By_Copy, u_Nodes_Struct);  -- a_nodes.h:2169

   subtype Nodes_Struct is u_Nodes_Struct;

end a_nodes_h;
