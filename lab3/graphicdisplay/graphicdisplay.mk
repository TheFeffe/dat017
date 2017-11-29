##
## Auto Generated makefile by CodeLite IDE
## any manual changes will be erased      
##
## Debug
ProjectName            :=graphicdisplay
ConfigurationName      :=Debug
WorkspacePath          :=/Users/antonlevholm/Desktop/Projekt/dat017/lab3
ProjectPath            :=/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay
IntermediateDirectory  :=./Debug
OutDir                 := $(IntermediateDirectory)
CurrentFileName        :=
CurrentFilePath        :=
CurrentFileFullPath    :=
User                   :=Anton Levholm
Date                   :=29/11/2017
CodeLitePath           :="/Users/antonlevholm/Library/Application Support/codelite"
LinkerName             :=/Users/antonlevholm/Downloads/gcc-arm-none-eabi-6-2017-q1-update/bin/arm-none-eabi-g++
SharedObjectLinkerName :=/Users/antonlevholm/Downloads/gcc-arm-none-eabi-6-2017-q1-update/bin/arm-none-eabi-g++ -shared -fPIC
ObjectSuffix           :=.o
DependSuffix           :=.o.d
PreprocessSuffix       :=.i
DebugSwitch            :=-g 
IncludeSwitch          :=-I
LibrarySwitch          :=-l
OutputSwitch           :=-o 
LibraryPathSwitch      :=-L
PreprocessorSwitch     :=-D
SourceSwitch           :=-c 
OutputFile             :=$(IntermediateDirectory)/$(ProjectName).elf
Preprocessors          :=
ObjectSwitch           :=-o 
ArchiveOutputSwitch    := 
PreprocessOnlySwitch   :=-E
ObjectsFileList        :="graphicdisplay.txt"
PCHCompileFlags        :=
MakeDirCommand         :=mkdir -p
LinkOptions            :=  -nostartfiles -nostdlib -T$(ProjectPath)/md407-ram.x
IncludePath            :=  $(IncludeSwitch). $(IncludeSwitch). 
IncludePCH             := 
RcIncludePath          := 
Libs                   := $(LibrarySwitch)gcc $(LibrarySwitch)c_nano 
ArLibs                 :=  "gcc" "c_nano" 
LibPath                := $(LibraryPathSwitch). $(LibraryPathSwitch)$(GccArmDir)/arm-none-eabi/lib/armv6-m $(LibraryPathSwitch)$(GccArmDir)/lib/gcc/arm-none-eabi/5.4.1/armv6-m 

##
## Common variables
## AR, CXX, CC, AS, CXXFLAGS and CFLAGS can be overriden using an environment variables
##
AR       := /Users/antonlevholm/Downloads/gcc-arm-none-eabi-6-2017-q1-update/bin/arm-none-eabi-ar rcu
CXX      := /Users/antonlevholm/Downloads/gcc-arm-none-eabi-6-2017-q1-update/bin/arm-none-eabi-g++
CC       := /Users/antonlevholm/Downloads/gcc-arm-none-eabi-6-2017-q1-update/bin/arm-none-eabi-gcc
CXXFLAGS :=  -g -O0 -Wall $(Preprocessors)
CFLAGS   :=  -g -O0 -mthumb -Wall -march=armv6-m -msoft-float -Wa,-adhln=test.s $(Preprocessors)
ASFLAGS  := 
AS       := /Users/antonlevholm/Downloads/gcc-arm-none-eabi-6-2017-q1-update/bin/arm-none-eabi-as


##
## User defined environment variables
##
CodeLiteDir:=/Applications/codelite.app/Contents/SharedSupport/
GccArmDir:=$(CodeLiteDir)/tools/gcc-arm
Objects0=$(IntermediateDirectory)/startup.c$(ObjectSuffix) $(IntermediateDirectory)/sys_delay.c$(ObjectSuffix) $(IntermediateDirectory)/gpio.c$(ObjectSuffix) 



Objects=$(Objects0) 

##
## Main Build Targets 
##
.PHONY: all clean PreBuild PrePreBuild PostBuild MakeIntermediateDirs
all: $(OutputFile)

$(OutputFile): $(IntermediateDirectory)/.d $(Objects) 
	@$(MakeDirCommand) $(@D)
	@echo "" > $(IntermediateDirectory)/.d
	@echo $(Objects0)  > $(ObjectsFileList)
	$(LinkerName) $(OutputSwitch)$(OutputFile) @$(ObjectsFileList) $(LibPath) $(Libs) $(LinkOptions)

PostBuild:
	@echo Executing Post Build commands ...
	/Applications/codelite.app/Contents/SharedSupport//tools/gcc-arm/arm-none-eabi/bin/objcopy -S -O srec  ./Debug/graphicdisplay.elf ./Debug/graphicdisplay.s19
	@echo Done

MakeIntermediateDirs:
	@test -d ./Debug || $(MakeDirCommand) ./Debug


$(IntermediateDirectory)/.d:
	@test -d ./Debug || $(MakeDirCommand) ./Debug

PreBuild:


##
## Objects
##
$(IntermediateDirectory)/startup.c$(ObjectSuffix): startup.c $(IntermediateDirectory)/startup.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/startup.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/startup.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/startup.c$(DependSuffix): startup.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/startup.c$(ObjectSuffix) -MF$(IntermediateDirectory)/startup.c$(DependSuffix) -MM startup.c

$(IntermediateDirectory)/startup.c$(PreprocessSuffix): startup.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/startup.c$(PreprocessSuffix) startup.c

$(IntermediateDirectory)/sys_delay.c$(ObjectSuffix): sys_delay.c $(IntermediateDirectory)/sys_delay.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/sys_delay.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/sys_delay.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/sys_delay.c$(DependSuffix): sys_delay.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/sys_delay.c$(ObjectSuffix) -MF$(IntermediateDirectory)/sys_delay.c$(DependSuffix) -MM sys_delay.c

$(IntermediateDirectory)/sys_delay.c$(PreprocessSuffix): sys_delay.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/sys_delay.c$(PreprocessSuffix) sys_delay.c

$(IntermediateDirectory)/gpio.c$(ObjectSuffix): gpio.c $(IntermediateDirectory)/gpio.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/antonlevholm/Desktop/Projekt/dat017/lab3/graphicdisplay/gpio.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/gpio.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/gpio.c$(DependSuffix): gpio.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/gpio.c$(ObjectSuffix) -MF$(IntermediateDirectory)/gpio.c$(DependSuffix) -MM gpio.c

$(IntermediateDirectory)/gpio.c$(PreprocessSuffix): gpio.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/gpio.c$(PreprocessSuffix) gpio.c


-include $(IntermediateDirectory)/*$(DependSuffix)
##
## Clean
##
clean:
	$(RM) -r ./Debug/


