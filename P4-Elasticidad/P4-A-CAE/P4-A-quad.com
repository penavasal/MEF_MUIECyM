from driverConstants import *
from driverStandard import StandardAnalysis
import driverUtils, sys
options = {
    'SIMExt':'.sim',
    'ams':OFF,
    'analysisType':STANDARD,
    'applicationName':'analysis',
    'aqua':OFF,
    'ask_delete':OFF,
    'background':None,
    'beamSectGen':OFF,
    'biorid':OFF,
    'cavityTypes':[],
    'cavparallel':OFF,
    'compile_cpp':['cl', '/c', '/W0', '/MD', '/TP', '/EHsc', '/DNDEBUG', '/DWIN32', '/DTP_IP', '/D_CONSOLE', '/DNTI', '/DFLT_LIC', '/DOL_DOC', '/D__LIB__', '/DHKS_NT', '/D_WINDOWS_SOURCE', '/DFAR=', '/D_WINDOWS', '/DABQ_WIN86_64', '%P', '/I%I', '/IC:\\SIMULIA\\CAE\\2022LE'],
    'compile_fmu':['win64CmpWrp', '-m64', '-msvc9', 'cl', '/LD', '/D_WINDOWS', '/TC', '/W0', '/I%I', '/IC:\\SIMULIA\\CAE\\2022LE'],
    'compile_fortran':['ifort', '/c', '/fpp', '/extend-source', '/DABQ_WIN86_64', '/DABQ_FORTRAN', '/iface:cref', '/recursive', '/Qauto', '/align:array64byte', '/Qpc64', '/Qprec-div', '/Qprec-sqrt', '/Qfma-', '/fp:precise', '/Qimf-arch-consistency:true', '/Qfp-speculation:safe', '/Qprotect-parens', '/Qfp-stack-check', '/reentrancy:threaded', '/QxSSE3', '/QaxAVX', '/include:%I', '/include:C:\\SIMULIA\\CAE\\2022LE', '%P', '/names:lowercase'],
    'complexFrequency':OFF,
    'contact':OFF,
    'cosimulation':OFF,
    'coupledProcedure':OFF,
    'cpus':1,
    'cse':OFF,
    'cyclicSymmetryModel':OFF,
    'directCyclic':OFF,
    'direct_port':'54095',
    'direct_solver':DMP,
    'doc_root':'http://138.100.64.169:4040/English',
    'dsa':OFF,
    'dynStepSenseAdj':OFF,
    'dynamic':OFF,
    'excite':OFF,
    'externalField':OFF,
    'externalFieldCSEAux':OFF,
    'externalFieldExtList':['.sim', '.SMAManifest'],
    'externalFieldFiles':[],
    'externalFieldSimReader':None,
    'fieldImport':OFF,
    'filPrt':[],
    'fils':[],
    'finitesliding':OFF,
    'flexiblebody':OFF,
    'foundation':OFF,
    'freqSimReq':OFF,
    'geostatic':OFF,
    'geotech':OFF,
    'heatTransfer':OFF,
    'impJobExpVars':{},
    'importJobList':[],
    'importSim':OFF,
    'importer':OFF,
    'importerParts':OFF,
    'includes':[],
    'initialConditionsFile':OFF,
    'input':'P4-A-quad',
    'inputFormat':INP,
    'interpolExtList':['.odb', '.sim', '.SMAManifest'],
    'job':'P4-A-quad',
    'keyword_licenses':[],
    'lanczos':OFF,
    'libs':[],
    'link_exe':['LINK', '/nologo', '/INCREMENTAL:NO', '/subsystem:console', '/machine:AMD64', '/STACK:20000000', '/NODEFAULTLIB:LIBC.LIB', '/NODEFAULTLIB:LIBCMT.LIB', '/DEFAULTLIB:OLDNAMES.LIB', '/DEFAULTLIB:LIBIFCOREMD.LIB', '/DEFAULTLIB:LIBIFPORTMD.LIB', '/DEFAULTLIB:LIBMMD.LIB', '/DEFAULTLIB:kernel32.lib', '/DEFAULTLIB:user32.lib', '/DEFAULTLIB:advapi32.lib', '/FIXED:NO', '/LARGEADDRESSAWARE', '/out:%J', '%F', '%M', '%L', '%B', '%O', 'oldnames.lib', 'user32.lib', 'ws2_32.lib', 'netapi32.lib', 'advapi32.lib', 'msvcrt.lib', 'vcruntime.lib', 'ucrt.lib'],
    'link_sl':['LINK', '/nologo', '/NOENTRY', '/INCREMENTAL:NO', '/subsystem:console', '/machine:AMD64', '/NODEFAULTLIB:LIBC.LIB', '/NODEFAULTLIB:LIBCMT.LIB', '/DEFAULTLIB:OLDNAMES.LIB', '/DEFAULTLIB:LIBIFCOREMD.LIB', '/DEFAULTLIB:LIBIFPORTMD.LIB', '/DEFAULTLIB:LIBMMD.LIB', '/DEFAULTLIB:kernel32.lib', '/DEFAULTLIB:user32.lib', '/DEFAULTLIB:advapi32.lib', '/FIXED:NO', '/dll', '/def:%E', '/out:%U', '%F', '%A', '%L', '%B', 'oldnames.lib', 'user32.lib', 'ws2_32.lib', 'netapi32.lib', 'advapi32.lib', 'msvcrt.lib', 'vcruntime.lib', 'ucrt.lib'],
    'listener_name':'DESKTOP-RS36UH2',
    'listener_resource':'4840',
    'magnetostatic':OFF,
    'massDiffusion':OFF,
    'materialresponse':OFF,
    'memory':'90%',
    'message':None,
    'messaging_mechanism':'DIRECT',
    'modifiedTet':OFF,
    'moldflowFiles':[],
    'moldflowMaterial':OFF,
    'mp_environment_export':('ABAQUSLM_LICENSE_FILE', 'ABAQUS_CCI_DEBUG', 'ABAQUS_CSE_CURRCONFIGMAPPING', 'ABAQUS_CSE_RELTIMETOLERANCE', 'ABAQUS_DEVL_MODE', 'ABAQUS_LANG', 'ABAQUS_MPF_DIAGNOSTIC_LEVEL', 'ABA_ADM_ALIGNMENT', 'ABA_ADM_MINIMUMDECREASE', 'ABA_ADM_MINIMUMINCREASE', 'ABA_ALL_ADB_IN_TMPDIR', 'ABA_CM_BUFFERING', 'ABA_CM_BUFFERING_LIMIT', 'ABA_CUTOFF_SLAVEFACET_ANGLE', 'ABA_DIRECT_SOLVER_PATH', 'ABA_DMPSOLVER_BWDPARALLELOFF', 'ABA_ELP_SURFACE_SPLIT', 'ABA_ELP_SUSPEND', 'ABA_ENABLE_DYNELEMS', 'ABA_EVOLVING_JOBS', 'ABA_EXT_SIMOUTPUT', 'ABA_GCONT_POOL_SIZE', 'ABA_HOME', 'ABA_INC_DEFAULT', 'ABA_ITERATIVE_SOLVER_VERBOSE', 'ABA_MEMORY_MODE', 'ABA_MPI_MESSAGE_TRACKING', 'ABA_MPI_VERBOSE_LEVEL', 'ABA_NEW_STOS_COHESIVE_APPROX_CONTACT', 'ABA_NEW_STOS_COHESIVE_CONTACT', 'ABA_NUM_INTEGRATION_POINTS_LINE3D', 'ABA_SHARED_SAVEDIR', 'ABA_PATH', 'ABA_PRE_DECOMPOSITION', 'ABA_PRINT_DYNELEMS', 'ABA_REMOVE_OVERCONSTRAINED_TIES', 'ABA_RESOURCE_MONITOR', 'ABA_RESOURCE_USEMALLINFO', 'ABA_RESULTS_OVERLAY', 'ABA_STD_ACTIVATE_CONTACT_FOR_AM', 'ABA_SYMBOLIC_GENERALCOLLAPSE', 'ABA_SYMBOLIC_GENERAL_MAXCLIQUERANK', 'ABA_TOSCA_JOB_STALL', 'ABA_TOSCA_OVERLAY', 'ABA_TOSCA_PROTOTYPE', 'ABA_TOSCA_SEQFILES', 'ABA_TOSCA_STALL', 'ABA_UNIT_INDEPENDENT_CONTACT', 'ABA_USE_NEW_STOS_SST_FORMULATION', 'ABA_USE_OLD_SURF_TO_SURF_CONTACT', 'ABA_POTENTIAL_DEV', 'ABQLMHANGLIMIT', 'ABQLMIMPL', 'ABQLMQUEUE', 'ABQLMUSER', 'ABQ_ACTIVATE_PTK', 'ABQ_BYPASS_UNCONNECTED_REGION_CHECK', 'ABQ_CRTMALLOC', 'ABQ_DATACHECK', 'ABQ_DLALLOCATOR', 'ABQ_PATTERN', 'ABQ_PATTERN_VALUE', 'ABQ_RECOVER', 'ABQ_RESTART', 'ABQ_SKIP_ANALYTIC_SURF_GCONT', 'ABQ_SPLITFILE', 'ABQ_STD_ACCUM_CSLIP', 'ABQ_STD_ACTIVATE_BEAM_ROTATION', 'ABQ_STD_ALLOW_SURFACE_TO_BEAM', 'ABQ_SUPERELASTIC_MODIFIED', 'ABQ_GC_HEAT', 'ABQ_GC_SMALL', 'ABQ_UREG_USE_CONTACT_ELEM', 'ABQ_XFEM_POREPRESSURE', 'ABQ_XPL_DSMABORT', 'ABQ_XPL_PARTITIONSIZE', 'ABQ_XPL_WINDOWDUMP', 'ACML_FAST_MALLOC', 'ACML_FAST_MALLOC_CHUNK_SIZE', 'ACML_FAST_MALLOC_DEBUG', 'ACML_FAST_MALLOC_MAX_CHUNKS', 'ADB_USE_OLDSLDB', 'ADB_USE_NEWSLDB', 'CCI_RENDEZVOUS', 'DOMAIN', 'DOMAIN_CPUS', 'DOUBLE_PRECISION', 'DSLS_AUTH_PATHNAME', 'DSLS_CONFIG', 'FI_PROVIDER', 'FI_PROVIDER_PATH', 'FLEXLM_DIAGNOSTICS', 'FOR0006', 'FOR0064', 'FOR_DISABLE_DIAGNOSTIC_DISPLAY', 'FOR_IGNORE_EXCEPTIONS', 'I_MPI_FABRICS', 'IPATH_NO_CPUAFFINITY', 'LD_PRELOAD', 'MALLOC_MMAP_THRESHOLD_', 'MKL_DYNAMIC', 'MKL_NUM_THREADS', 'MPCCI_CODEID', 'MPCCI_DEBUG', 'MPCCI_JOBID', 'MPCCI_NETDEVICE', 'MPCCI_SERVER', 'MPCCI_TINFO', 'MPC_GANG', 'MPIEXEC_AFFINITY_TABLE', 'MPI_FLAGS', 'MPI_FLUSH_FCACHE', 'MPI_PROPAGATE_TSTP', 'MPI_SOCKBUFSIZE', 'MPI_USE_MALLOPT_MMAP_MAX', 'MPI_USE_MALLOPT_MMAP_THRESHOLD', 'MPI_USE_MALLOPT_SBRK_PROTECTION', 'MPI_WORKDIR', 'MPIR_CVAR_CH4_OFI_TAG_BITS', 'MPIR_CVAR_CH4_OFI_RANK_BITS', 'MP_NUMBER_OF_THREADS', 'MPICH_ND_ZCOPY_THRESHOLD', 'NCPUS', 'OMP_DYNAMIC', 'OMP_NUM_THREADS', 'OUTDIR', 'PAIDUP', 'PARALLEL_METHOD', 'RAIDEV_NDREG_LAZYMEM', 'SMA_PARENT', 'SMA_PLATFORM', 'SMA_WS', 'SIMULIA_COSIN_PATH', 'STD_INITSTRESS_FLAG', 'STD_INITGEOICS_FLAG', 'XPL_HMP_COMMTHREAD'),
    'mp_file_system':(DETECT, DETECT),
    'mp_mode':THREADS,
    'mp_mode_requested':MPI,
    'mp_mpi_implementation':NATIVE,
    'mp_mpi_searchpath':['Microsoft MPI', 'Microsoft HPC Pack', 'Microsoft HPC Pack 2008 R2', 'Microsoft HPC Pack 2008', 'Microsoft HPC Pack 2008 SDK', 'Microsoft HPC Pack 2012'],
    'mp_mpirun_path':{MSSDK: 'C:\\Program Files\\Microsoft MPI', NATIVE: 'C:\\Program Files\\Microsoft MPI\\bin\\mpiexec.exe'},
    'mp_rsh_command':'dummy %H -l %U -n %C',
    'multiphysics':OFF,
    'noDmpDirect':[],
    'noMultiHost':[],
    'noMultiHostElemLoop':[],
    'no_domain_check':1,
    'onCaeGraphicsStartup':driverUtils.decodeFunction('begin 666 -\nM8P     I    ,P   $,   !S 1$  &0! &0  &P  \'T  \'P  &H! \'P  &H"\nM &0" (,"  %T P!J! !J!0!] 0!T P!J! !J!@!] @!T P!J! !J!P!] P!T\nM P!J! !J" !]! !T P!J! !J"0!]!0!T"@!]!@!T"P!]!P!T"P!]" !T"P!]\nM"0!T# !T#0!T#@!T#P!F! !]"@!T$ !]"P!T$0!]# !T P!J$@!J$P!]#0!T\nM P!J$@!J% !]#@!T P!J$@!J%0!]#P!T P!J$@!J%@!]$ !T"P!]$0!T"P!]\nM$@!T"P!]$P!D P!]% !T"P!]%0!T P!J$@!J%P!]%@!T P!J$@!J& !]%P!T\nM P!J$@!J&0!]& !T P!J$@!J&@!]&0!T P!J$@!J&P!]&@!T P!J$@!J\' !]\nM&P!T P!J$@!J\'0!]\' !T P!J$@!J\'@!]\'0!D! !]\'@!D! !]\'P!\\! !D  !K\nM @!S;P%\\! !D!0!K @!S;P%\\! !D!@!K @!RZ %D!P!]\'P!T$0!]& !D" !]\nM#0!D"0!]#@!\\! !D  !K @!R3 )\\!0!D!  99   :P, <DP"? 4 9 0 &60*\nM &L! \'/3 7P% &0$ !ED"P!K @!RY0%\\!0!D!P 99 < :P  <N4!9 @ ?0T \nM9 P ?0X <>4!<4P";F0 ? 0 9 T :P( <@,"9 X ?0T 9 \\ ?0X ;DD ? 0 \nM9!  :P( <DP"? ( 9!$ :P( <BH"9 @ ?0T 9!( ?0X <4P"? ( 9!, (&04\nM &L" \'), F05 \'T- &0/ \'T. \'%, FX  \'P! &06 &L" \'(4 W01 \'T; \'P"\nM &07 "!D& !K @!R@P)T$0!]$0!D&0!]#0!D&@!]#@!QBPY\\ @!D&P!K @!R\nMK0)\\\'P!RG@)T$0!]%P!Q$0-D\' !]#0!D"0!]#@!QBPY\\ @!D\'0!K @!RW0)D\nM\'@!]#0!D\'P!]#@!T$0!]$0!T# !T#0!T#P!F P!]"@!QBPY\\ @!D(  @9"$ \nM:P( <HL.9"( ?0T 9", ?0X =!$ ?1$ = P = T = \\ 9@, ?0H <8L.;G<+\nM? $ 9"0 (&0E &L" \'(Y"&0! &0F &P@ &TA \'T@ &TB \'TA  %\\\'P!R20-T\nM$0!]& !N!@!D" !]#0!T$0!]$@!D)P!]% !\\ P!D!  99"0 :P0 <HT#= L \nM?1( 9 $ 9   ;", ?2( 9"@ ?"( :B0 9"D /&X  \'P# &0$ !ED*@!K! !S\nMO0-\\ P!D!  99"H :P( <E\\%? , 9 < &60\' &L% \')?!60! &0  &PE \'TC\nM \'PC &HF \'P# &0J !ED*P"# @!]) !T)P!\\) "# 0!D!P!K!0!R7P5Y%P!\\\nM(P!J* !\\) !D!  9@P$ ?24 5VX-  $! 60L \'TE &X! %A\\)0!D+0!K  !R\nM,01\\)0!D+@ 4?24 ;@  ?"4 9"\\ :P4 <EP%?!\\ <F<$? ( 9#  :P( <UX$\nM?"  9#$ ? ( @P( <F<$9"H ?1T ;AD 9 $ 9   ;", ?2( 9"@ ?"( :B0 \nM9"D /\'PE &05 &L% \')9!701 \'T1 \'PE &0R &L% \'*_!\'PE &0S &L  \'*_\nM!\'P= &0D &L$ \'*_!&0D \'T= &XJ \'PE &0S &L$ \'+I!\'0+ \'T1 \'PE &0(\nM &L$ \'+I!&0+ \'T= \'\'I!&X  \'P? \')6!7E" &0! &0  &PI \'TF \'PF &HJ\nM (,  &0$ !ED*@ @9#0 :P( <C %=!$ ?1D = T = X = \\ 9@, ?0H ;@  \nM5W%3!0$! 701 \'T9 \'0- \'0. \'0/ &8# \'T* \'%3!5AQ5@5Q605Q7 5Q7P5N\nM  !\\( !D-0!\\ @!\\(0"# P!RA@5T$0!]&P!D! !])P!T$0!]&0!N  !\\( !D\nM-@!\\ @!\\(0"# P!SJ@5\\( !D-P!\\ @!\\(0"# P!R\'P=T$0!]"0!\\( !D. !\\\nM @"# @!SS@5\\( !D.0!\\ @"# @!R6P9T"P!]"0!T$0!]&P!\\( !D.@!\\ @"#\nM @!R^ 5D.P!]#0!D#P!]#@!Q=@9\\( !D/ !\\ @"# @!R$ 9D&@!]#0!Q=@9\\\nM( !D/0!\\ @"# @!R* 9T$0!]$P!Q=@9\\( !D,0!\\ @"# @!R0 9T$0!]$P!Q\nM=@9\\( !D/@!\\ @"# @!R=@9T$0!]$0!Q=@9N&P!\\( !D-P!\\ @!\\(0"# P!R\nM=@9D*@!]\'0!N  !\\( !D/P!\\ @!\\(0"# P!R\'P=T$0!]"0!T$0!]$0!\\( !D\nM0 !\\ @!\\(0"# P!RKP9T"P!]"0!Q\' =\\( !D00!\\ @"# @!R\' =T"P!]$0!\\\nM( !D0@!\\ @"# @!R[P9D 0!D  !L(P!](@!D0P!\\(@!J) !D1  \\;@  ?"  \nM9$4 ? ( @P( <AD\'=!$ ?1D = T = X = \\ 9@, ?0H <1D\'<1P\'<1\\\';@  \nM?"  9$8 ? ( @P( <O0\'?"  9$< ? ( @P( <GD\'?!\\ <FH\'? , 9+\\ :P( \nM<G8\'=!$ ?1D = X = T = \\ 9@, ?0H <78\'<?$\'9#L ?0T 9 \\ ?0X <38(\nM?"  9$D ? ( @P( <Y<\'?"  9$H ? ( @P( <M,\'?!\\ <O$\'?!D =!$ :P, \nM<KX\'= P = X = T = \\ 9@0 ?0H <= \'= X = T = \\ 9@, ?0H <?$\'<38(\nM?"  9$L ? ( @P( <C8(9 @ ?0T 9 \\ ?0X <38(<8L.?"  9$P ? ( @P( \nM<AL(=!$ ?1D = T = X = \\ 9@, ?0H <8L.? ( 9$T :P( <HL.9 D ?0T \nM9$X ?0X <8L.;E(&? $ 9$\\ :P( <ET(? ( 9%  :P( <HL.9%$ ?0T <8L.\nM;BX&? $ 9%( :P( <HT(? ( 9%, :P( <HL.=!$ ?1$ 9#L ?0T 9#L ?0X \nM<8L.;OX%? $ 9%0 :P( <M((? ( 9%4 :P( <K0(9 @ ?0T 9%8 ?0X <8L.\nM? ( 9%< :P( <HL.9%@ ?0T 9%D ?0X <8L.;KD%? $ 9%H :P( <ED)? ( \nM9%L :P( <OD(9%P ?0T 9%T ?0X <8L.? ( 9%X :P( <AH)9%\\ ?0T 9#L \nM?0X =!$ ?14 <8L.? ( 9&  :P( <CL)9 @ ?0T 9 \\ ?0X =!$ ?1, <8L.\nM? ( 9&$ :P( <HL.=!$ ?1D = T ?0H <8L.;C(%? $ 9&( :P( <NH)=!$ \nM?1P = P = X = T = \\ 9@0 ?0H ? ( 9&, :P( <I@)=!$ ?0D =!$ ?1L \nM<8L.? ( 9&0 :P( <K\\)= P = T = X = \\ 9@0 ?0H =!$ ?1( <8L.? ( \nM9&4 (&1F &L" \'*+#G0- \'0. \'0/ &8# \'T* \'01 \'T7 \'&+#FZA!\'P! &1G\nM &L" \'(2"GP" &03 "!D: !K @!RBPYT$0!]& !QBPYN>01\\ 0!D:0!K @!R\nM=@U\\\'P!S0 ID 0!D  !L(P!](@!D:@!\\(@!J) !D:P \\;@  ? 0 9&D :P( \nM<E@+=!$ ?1@ ? ( 9&P (&1M &L" \'.B"GP" &1L "!D;@!K @!SH@I\\ @!D\nM%P @9&\\ :P( <Z(*? ( 9!< (&1P &L" \'.B"GP" &07 "!D<0!K @!RJPID\nM" !]#0!Q\'0Q\\ @!D;  @9\'( :P( <L0*=!$ ?1L <1T,? ( 9&P (&1S &L"\nM \'+="F0D \'T= \'$=#\'P" &1T "!D=0!K @!R_ ID=@!]#0!D3@!]#@!Q\'0Q\\\nM @!D=P @9\'@ :P( <CP+9 \\ ?0T 9 @ ?0X ? ( 9\'D :P( <E4+? , 9,  \nM:P( <E4+9\'L ?1X <54+<1T,? ( 9\'< (&1\\ &L" \'(=#\'01 \'T; \'$=#&[%\nM \'P? \'(=#\'P" &1] "!D?@!K @!SC@M\\ @!D?P @9(  :P( <XX+? ( 9\'\\ \nM(&2! &L" \'(=#\'01 \'T8 \'P" &1L "!D;0!K @!RK0MD#P!]#0!Q&@Q\\ @!D\nM;  @9(( :P( <L8+=!$ ?1L <1H,? ( 9&P (&2# &L" \'+E"V0D \'T= &0C\nM \'T- \'$:#\'P" &1L "!D<P!K @!R_@MD) !]\'0!Q&@Q\\ @!D=  @9\'4 :P( \nM<AH,=!$ ?1$ <1H,<1T,;@  ? ( 9!< (&1P &L" \');#&0! &0  &PI \'TF\nM \'PF &HJ (,  &0$ !EDA !K @!R<PUD" !]#0!Q<PUQBPY\\ @!DA0 @9(8 \nM:P( <G0,9"0 ?1T <8L.? ( 9"X (&2\' &L" \'*9#\'01 \'T8 \'01 \'T< &0J\nM \'T= \'&+#GP" &1T "!DB !K @!R& U\\\'P!R_0QT#@!T#0!T#P!F P!]"@!D\nM" !]#0!D.P!]#@!\\ P!DP0!K @!R%0UD" !]#@!\\ @!DB0!K @!R\\0QT$0!]\nM$@!Q^@QT$0!]"0!Q%0UQ<PUD" !]#0!DB@!]#@!T$0!]$0!T$0!]&P!QBPY\\\nM @!DBP!K @!R,PUD" !]#0!D#P!]#@!QBPY\\ @!DC !K @!R3@UD.P!]#0!D\nMC0!]#@!QBPY\\ @!D?0 @9(X :P( <HL.9 @ ?0T 9%D ?0X =!$ ?1@ <8L.\nM;A4!? $ 9 T :P( <M0-? ( 9!, (&2/ &L" \'*G#60( \'T- &19 \'T. \'01\nM \'T3 \'&+#GP" &20 &L" \'*\\#60( \'T- \'&+#GP" &21 &L" \'*+#G01 \'T3\nM \'&+#FZW \'P! &22 &L" \'(-#G01 \'T1 \'P" &23 &L" \'*+#G01 \'T9 \'0-\nM \'0. \'0/ &8# \'T* \'&+#FY^ \'P! &24 &L" \'*+#GP" &25 &L" \',Q#GP"\nM &26 &L" \'*+#GP# &3" &L" \')&#F28 \'T- &XS &0! &0  &PK \'TH \'PH\nM &HL (,  &29 &L" \')S#G01 \'T) &2: \'T- &X& &2; \'T- &2< \'T. \'01\nM \'T8 \'&+#FX  \'P" &0* "!DG0!K @!RD@]T#@!T#0!T#P!F P!]"@!D 0!D\nM  !L(P!](@!DG@!\\(@!J) !K!P!RS@YT$0!]\' !N  !\\ P!D!  99 < :P( \nM<I(/? , 9 < &60+ &L  \'*2#V0H \'PB &HD &2? #Q\\ @!DH !K @!RCP]\\\nM 0!DH0!K @!R: ]\\ P!D!  99 < :P( <HD/? , 9 < &60J &L" \'*)#WP#\nM &0J !ED=  @9*( :P( <HD/= T = X = \\ 9@, ?0H 9 @ ?0T =!$ ?1L \nM<8D/<8P/? $ 9*, :P( <HP/9#L ?0T 9*0 ?0X =!$ ?0D <8P/<8\\/<9(/\nM;@  ? 0 9   :P( <B00? ( 9 H (&2= &L# \'(D$\'P" &2E &L" \'+##W01\nM \'T< &X  &0( \'T/ &0) \'T0 \'P% &0$ !ED  !K P!R,!!\\!0!D!  99 H \nM:P$ <P\\0? 4 9 0 &60+ &L" \'(A$\'P% &0\' !ED!P!K  !R(1!D" !]#0!D\nM# !]#@!Q(1!Q,!!N# !\\#0!]#P!\\#@!]$ !T$0!\\$P!K @!R11!T$0!]%0!N\nM  !T$0!\\"0!K @!R6A!T+0!]"P!N  !T P!J$@!J+@!DI@!\\!@!DIP!\\!P!D\nMJ !\\" !DJ0!\\"0!DJ@!\\"@!DJP!\\"P!DK !\\# !DK0!\\\' !DK@!\\\'0!DKP!\\\nM#0!DL !\\#@!DL0!\\#P!DL@!\\$ !DLP!\\$0!DM !\\$@!DM0!\\$P!DM@!\\%0!D\nMMP!\\% !DN !\\%@!DN0!\\%P!DN@!\\& !DNP!\\&0!DO !\\&@!DO0!\\&P!DO@!\\\nM\'@"# !D!9   4RC#    3FG_____= $   !#9_%HXXBU^-0^:0    !S\'P  \nM $AU;6UI;F=B:7)D($-O;6UU;FEC871I;VYS($QT9"YS$    $AU;6UI;F=B\nM:7)D($QT9"YI 0   &<       #P/V<       #H/VD$    :04   !G,0BL\nM\'%ID^S]T P   %-\'26=[%*Y\'X7JD/V<       #X/W0#    24)-<PX   !\'\nM6%0X,# @5&5X=\'5R96>%ZU&X\'H4!0&D&    = 8   !\'6%0X,#!GUZ-P/0K7\nMZS]T!@   #-$;&%B<VD-    <PT   !7:6QD8V%T(%90.#@P9P       !9 \nM9YJ9F9F9F>D_= D   !015)-141)03-G,S,S,S,SPS]S"P   $=,24Y4(%(S\nM(%!49YJ9F9F9F:D_9V9F9F9F9N8_:1D   !S&0   $=,24Y4(%(S(%!4("L@\nM1TQ)3E0@1V%M;6%GFIF9F9F9V3]G         $!I P   \'0#    051)* ( \nM  !T!@   \'-E87)C:\'0*    24=.3U)%0T%316<M0QSKXC8*/W0!    ,707\nM    04)!45537T%,3$]77T%425]44D%.4TQI @   \'0!    (&<         \nM &<S,S,S,S/3/VD*    9W$;#> MD.H_<Q    !!5$D@1FER94=,(%8W,S P\nM= 4   !6,S0P,&=Q/0K7HW#M/V=8.;3(=K[O/W0"    ,S)T"    $U/0DE,\nM2519= 0   !&:7)E= 8   !2861E;VYS"    $9I<F5\'3"!6= ,   !0<F]T\nM!0   %8W,3 P9P       . _= 4   !6-3$P,\'0%    5C,R,#!T!0   %8Y\nM.# P= @   !-;V)I;&ET>7,7    36]B:6QI=\'D@4F%D96]N($A$(#,V-3!S\nM"0   $9I<F5\'3"!6-7,,    1FER94=,(%8U,C P= $    P=!8   !!0D%1\nM55-?25-625-?5$A215-(3TQ$<PP   !&:7)E1TP@5C4W,#!S"    $9I<F4@\nM1TP@<PH   !&:7)E($=,(%0R<P4    N-#4Q.7,*    1FER92!\'3"!8,7,*\nM    1FER92!\'3"!:,7,,    1FER92!\'3" X># P<PL   !&:7)E($=,.#@P\nM,\',4    4D%\'12 Q,C@@4\')O(\'@X-B]34T5G,S,S,S,S^S]T!@   $-O;7!A\nM<7,(    4$)81T0M041G%*Y\'X7H4[C]S$@   $1I86UO;F0@375L=&EM961I\nM87,(    1FER92!\'3#%T!    $5,4T%S#0   $5,4T$@15)!6D]2(%AGFIF9\nMF9F9X3]S#P   $5,4T$@4WEN97)G>2!)26>X\'H7K4;C./V<S,S,S,S/K/W,7\nM    2&5W;&5T="U086-K87)D($-O;7!A;GET!P   &AP=FES9GAG*5R/PO4H\nM[#]GS<S,S,S,[#]T"P   &QI8C,U86-D83,P9PK7HW ]"N\\_= L   !L:6)D\nM9\'9I<WAG;\',5    5FER=\'5A;"!-96UO<GD@1\')I=F5R= 4   !);G1E;\',+\nM    26YT96P@.30U1TUS#0   $EN=&5L($-A;G1I9V%I(    \',@    36]B\nM:6QE($EN=&5L*%(I(#0@4V5R:65S($5X<\')E<W-S%@   $EN=&5R9W)A<&@@\nM0V]R<&]R871I;VYT!@   \'=C9V1R=G,2    3E9)1$E!($-O<G!O<F%T:6]N\nM= (   !/3G02    04)!45537T1)4T%"3$5?1E!%:0X   !S#@   %%U861R\nM;R!&6" T-C P<PX   !1=6%D<F\\@1E@@,3<P,\',-    475A9\')O($98(#4X\nM,\',-    475A9\')O($98(#4W,\',-    475A9\')O($98(#,W,\',.    475A\nM9\')O($98(#,U,#!S#@   %%U861R;R!&6" X.#!-:0L   !S"P   %%U861R\nM;S(@4\')O9P        1 :0\\   !S#P   %%U861R;S0@-S4P(%A\'3\',8    \nM475A9\')O-" W-3 @6$=,+T%\'4"]34T4R<P\\    N,2!.5DE$24$@-3,N,S9I\nM-0   \'0\'    1V5&;W)C96D)    <PD   !1=6%D<F\\@1EAI!P   \'0\'    \nM475A9\')O-\'0\'    475A9\')O,G,.    475A9\')O($98(#$S,#!S#@   %%U\nM861R;R!&6" U-S!-= 4    V-&)I=&D,    <PP   !1=6%D<F\\@,3 P,$US\nM"@   %%U861R;R!.5E-S"P   %%U861R;S(@35A2<Q0   !1=6%D<F\\R($U8\nM4B]!1U O4U-%,F=F9F9F9F;^/W,3    1V5&;W)C92 R-38O4$-)+U-317,.\nM    4DE602!43E0@*%!#22EGA>M1N!Z%_S]S"0   %))5D$@5$Y4,G0&    \nM24U004-4<PD   !215,O4R\\Q+S)S"@   %904D\\O0B\\Q,CAS%@   %-U;B!-\nM:6-R;W-Y<W1E;7,L($EN8RYS#0   %A64BTQ,C P+"!625-S"@   $)R:6%N\nM(%!A=6QS"    $UE<V$@6#$Q<PX   !-97-A($]F9E-C<F5E;G,*    365S\nM82 S+C0N,F=[%*Y\'X7JT/W0(    ;&YX.#9?-C1G        24!G      " \nM04!G        \\C]T!    $UE<V%T#    $%"45]105]04DE.5\'0+    3453\nM05].3U]!4TUS$0   $UE<V$@1TQ8($EN9&ER96-T<QP   !-97-A(\'!R;VIE\nM8W0Z(\'=W=RYM97-A,V0N;W)G<PL    H,2XU($UE<V$@-G,6    5D$@3&EN\nM=7@@4WES=&5M<RP@26YC+F=2N!Z%ZU\'T/W,+    1T1)($=E;F5R:6-T#@  \nM &=R87!H:6-S1\')I=F5R= \\   !D;W5B;&5"=69F97)I;F=T#P   &)A8VMF\nM86-E0W5L;&EN9W0,    9&ES<&QA>4QI<W1S=!,   !H:6=H;&EG:\'1-971H\nM;V1(:6YT= @   !D<F%G36]D9702    875T;T9I=$%F=&5R4F]T871E= D \nM  !A;G1I06QI87-T$    \'1R86YS;\'5C96YC>4UO9&5T%0   \'!O;\'EG;VY/\nM9F9S971#;VYS=&%N=\'02    <&]L>6=O;D]F9G-E=%-L;W!E=!H   !P<FEN\nM=%!O;\'EG;VY/9F9S971#;VYS=&%N=\'07    <\')I;G10;VQY9V]N3V9F<V5T\nM4VQO<&5T#    \'9E<G1E>$%R<F%Y<W0:    =F5R=&5X07)R87ES26Y$:7-P\nM;&%Y3&ES=\'-T#@   \'1E>\'1U<F5-87!P:6YG=!,   !P<FEN=%1E>\'1U<F5-\nM87!P:6YG=!P   !C;VYT;W5R4F%N9V5497AT=7)E4\')E8VES:6]N= \\   !D\nM:7)E8W1296YD97)I;F=T%    &AA<F1W87)E06-C96QE<F%T:6]N=!,   !A\nM8V-E;&5R871E3V9F4V-R965N= \\   !H87)D=V%R94]V97)L87ET#P   &)A\nM8VMG<F]U;F1#;VQO<G0,    8F%C:VEN9U-T;W)E= D   !?=FES=6%L260H\nM P   &D!    :04   !S!0   "XT-3$Y* ,   !I 0   &D$    <P\\    N\nM,2!.5DE$24$@-3,N,S8H P   &D!    :0(   !.* ,   !I 0   &D"    \nM<PH   !-97-A(#,N-"XR*"\\   !T!@   &QO8V%L970)    <V5T;&]C86QE\nM= H   !,0U].54U%4DE#= <   !S97-S:6]N= P   !G<F%P:&EC<TEN9F]T\nM"    &=L5F5N9&]R= H   !G;%)E;F1E<F5R= D   !G;%9E<G-I;VYT#P  \nM &=L>%-E<G9E<E9E;F1O<G00    9VQX4V5R=F5R5F5R<VEO;G0\'    3U!%\nM3E]\'3%(@    =!    !(05)$5T%215]/5D523$%9=!    !33T945T%215]/\nM5D523$%9= ,   !83U)T!0   $),14Y$= 4   !!4U])4W0#    3T9&=!8 \nM  !D969A=6QT1W)A<&AI8W-/<\'1I;VYS4C0   !2-0   %(V    4C<   !2\nM/0   %(^    4C\\   !20    %)!    4D(   !2,@   %(S    = 0   !.\nM;VYE= (   !R95(\'    4@@   !T @   &]S= <   !E;G9I<F]N= 8   !S\nM=\')I;F=T!0   \'-P;&ET= ,   !L96YT!    &%T;V9T"    \'!L871F;W)M\nM= P   !A<F-H:71E8W1U<F5T P   \'5T:70+    9V5T4&QA=&9O<FUT!   \nM $9!4U1T"0   \'-E=%9A;\'5E<R@I    4D0   !220   %)*    4DL   !2\nM3    %)-    4BL   !2+    %(M    4BX   !2+P   %(P    4C$   !2\nM-    %(U    4C8   !2-P   %(X    4CD   !2.@   %(\\    4CL   !2\nM/0   %(^    4C\\   !20    %)!    4D(   !2,@   %(S    = @   !V\nM:7-U86Q)9\'03    9&ES<&QA>6EN9U1O5VEN9&]W<U(\'    4@@   !26   \nM %):    = 8   !F:65L9\'-T!    &9V86Q27@   \'0=    =FEE=TUA;FEP\nM1&ES<&QA>4QI<W14:\')E<VAO;&128    "@     *     !S.0   $,Z7%-)\nM355,24%<0T%%7#(P,C),15QW:6Y?8C8T7%--05QS:71E7&=R87!H:6-S0V]N\nM9FEG+F5N=G04    ;VY#865\'<F%P:&EC<U-T87)T=7 !    <PH#     PP!\nM$P,, 0P!# $, 0P2!@$& 08!!@$2 08!!@$, 0P!# $, 08!!@$& 08!!@$,\nM 0P!# $, 0P!# $, 0P!!@0&! P!# $, @8#!@,& 08#\' (0 2 !!@$/ @P"\nM!@$) @P"# $& 0D!$ $& 0P$# (& A "!@$& 0D"# (& @D#!@$) @P"!@$&\nM @8"$@(0 @8!!@(& A4"$ (6 P8!"0(& @8#!@,0 08!# $0 3 !# $6 1(!\nM P$7 0,!"@(, 0T!# 42 0\\!"0(, 0T%# $& B0!"0$, 08!# $, 08! P$,\nM 1H!!@$6 0,!!@$B Q(!!@$& @D"$@$2 @8"#P$/! 8\'!@(/ 08!"0(/ 0D"\nM#P$) P\\!"00/ 0P"$@$) A(!!@$&!!(!"04/ 08"#P$, 1 "#P$& 1L"#P(/\nM @8"# ,& 14$!@$) @\\!#P(& 0P!%0(5 @\\!!@$, @\\#!@$2"PP"!@$, @P"\nM# (, @P"# (& 08!# (, @P!!@$) @P"!@$, @P"# $& 0D"# (& 08$"0(,\nM @8!!@,) @P$!@$, @P"!@02 @P"!@$) @P!$@$) A !#P$, @P"$ (, @P"\nM!@(, 1 "# 0& A !$ $0 1 !$ $) A ""0(0 @D"$ $& 0D"$ $& 08"# $,\nM 0P"$ (,!@8"$ $0 1 #!@(0 0D"$ $) A !!@$) A ""0(0 0\\"$ (, 18!\nM# (0 @D"$ (& 08!"0(0 @8"#P$& 08"# $&!0P!"0(, P8!!@,&! D"# ,&\nM 0D"# $& 0D"$ ,& 08## (, A !!@$& 0D## $) PP!# (,!@8*# (& 14"\nM# $, 0P!# $) PP!$@$& 0D"!@(& 0P#$ $/ 0P!#P$) 2 %#0(, 0P#( $4\nM 0\\!!@$, @P"!@$& 1(%# $0 @P!"0,& 08#$ $0 2 !!@$/ P8!!@(, 0D%\nM# $) @P!!@$& 08!!@$& 08!!@$& 08!!@$& 08!!@$& 08!!@$& 08!!@$&\n) 08!!@$& 08!\n \nend\n'),
    'onestepinverse':OFF,
    'outputKeywords':ON,
    'parameterized':OFF,
    'partsAndAssemblies':ON,
    'parval':OFF,
    'pgdHeatTransfer':OFF,
    'postOutput':OFF,
    'preDecomposition':ON,
    'restart':OFF,
    'restartEndStep':OFF,
    'restartIncrement':0,
    'restartStep':0,
    'restartWrite':OFF,
    'resultsFormat':ODB,
    'rezone':OFF,
    'runCalculator':OFF,
    'simPack':OFF,
    'soils':OFF,
    'soliter':OFF,
    'solverTypes':['DIRECT'],
    'standard_parallel':ALL,
    'staticNonlinear':ON,
    'steadyStateTransport':OFF,
    'step':ON,
    'stepSenseAdj':OFF,
    'stressExtList':['.odb', '.sim', '.SMAManifest'],
    'subGen':OFF,
    'subGenLibs':[],
    'subGenTypes':[],
    'submodel':OFF,
    'substrLibDefs':OFF,
    'substructure':OFF,
    'symmetricModelGeneration':OFF,
    'tempNoInterpolExtList':['.fil', '.odb', '.sim', '.SMAManifest'],
    'thermal':OFF,
    'tmpdir':'C:\\Users\\PNA\\AppData\\Local\\Temp',
    'tracer':OFF,
    'transientSensitivity':OFF,
    'unfold_param':OFF,
    'unsymm':OFF,
    'visco':OFF,
    'xplSelect':OFF,
}
analysis = StandardAnalysis(options)
status = analysis.run()
sys.exit(status)
