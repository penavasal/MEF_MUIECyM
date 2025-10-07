# -*- coding: mbcs -*-
#
# Abaqus/CAE Release 2022 replay file
# Internal Version: 2021_09_15-19.57.30 176069
# Run by PNA on Mon Oct 28 11:01:44 2024
#

# from driverUtils import executeOnCaeGraphicsStartup
# executeOnCaeGraphicsStartup()
#: Executing "onCaeGraphicsStartup()" in the site directory ...
#: Executing "onCaeGraphicsStartup()" in the home directory ...
from abaqus import *
from abaqusConstants import *
session.Viewport(name='Viewport: 1', origin=(0.0, 0.0), width=165.21875, 
    height=183.892578125)
session.viewports['Viewport: 1'].makeCurrent()
session.viewports['Viewport: 1'].maximize()
from caeModules import *
from driverUtils import executeOnCaeStartup
executeOnCaeStartup()
openMdb('prac4_2022.cae')
#: A new model database has been created.
#: The model "Model-1" has been created.
session.viewports['Viewport: 1'].setValues(displayedObject=None)
#* MdbError: The database D:\OneDrive - Universidad Politécnica de 
#* Madrid\00_CLASES\Elementos_finitos\MEF_MUIECyM\P2-Calor_y_P3-Filtracion\P2_2022\prac4_2022.cae 
#* was created with Abaqus/CAE Learning Edition.
#* 
#* Files created with Abaqus/CAE Learning Edition cannot be used with the 
#* commercial release of Abaqus/CAE
