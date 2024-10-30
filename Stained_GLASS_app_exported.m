classdef Stained_GLASS_app_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                        matlab.ui.Figure
        PeritumorPanel                  matlab.ui.container.Panel
        PeritumorTranparencySlider      matlab.ui.control.Slider
        TranparencySliderLabel          matlab.ui.control.Label
        InvertCheckBox                  matlab.ui.control.CheckBox
        PeritumorcolormapDropDown       matlab.ui.control.DropDown
        PeritumorcolormapDropDownLabel  matlab.ui.control.Label
        PeritumorShoreIntervalsEditField  matlab.ui.control.EditField
        PeritumorcutoffdistancesLabel   matlab.ui.control.Label
        PeritumorDemoAxes               matlab.ui.control.UIAxes
        StainThresholdPanel             matlab.ui.container.Panel
        HScoreTextArea                  matlab.ui.control.TextArea
        HScoreTextAreaLabel             matlab.ui.control.Label
        negative1low2medium3highLabel   matlab.ui.control.Label
        ClassnamesTextAreaLabel         matlab.ui.control.Label
        StainClassNamesTextArea         matlab.ui.control.TextArea
        StainThresholdsEditField        matlab.ui.control.EditField
        StainthresholdsEditFieldLabel   matlab.ui.control.Label
        StainECDFPreviewFileDropDown    matlab.ui.control.DropDown
        PreviewfileDropDownLabel        matlab.ui.control.Label
        RefreshStainECDFPlotButton      matlab.ui.control.Button
        UseCustomThesholdCheckBox       matlab.ui.control.CheckBox
        StainECDFAxes                   matlab.ui.control.UIAxes
        CellAnnotationPanel             matlab.ui.container.Panel
        HERegexResultEditField          matlab.ui.control.EditField
        ResultEditFieldLabel            matlab.ui.control.Label
        HEImageNameRegexEditField       matlab.ui.control.EditField
        ImagenameextractorregexLabel    matlab.ui.control.Label
        StainRegexResultEditField       matlab.ui.control.EditField
        ResultEditFieldLabel_2          matlab.ui.control.Label
        StainImageNameRegexEditField    matlab.ui.control.EditField
        ImagenameextractorregexLabel_2  matlab.ui.control.Label
        StainImageNameDropDown          matlab.ui.control.DropDown
        HEimagenameLabel_2              matlab.ui.control.Label
        VariablePreviewDropDown         matlab.ui.control.DropDown
        PreviewfileDropDown_2Label      matlab.ui.control.Label
        PositionUnitDropDown            matlab.ui.control.DropDown
        PositionunitDropDownLabel       matlab.ui.control.Label
        YPositionDropDown               matlab.ui.control.DropDown
        YpositionDropDownLabel          matlab.ui.control.Label
        XPositionDropDown               matlab.ui.control.DropDown
        XpositionDropDownLabel          matlab.ui.control.Label
        StainIntensityDropDown          matlab.ui.control.DropDown
        StainIntensityDropDownLabel     matlab.ui.control.Label
        StainClassDropDown              matlab.ui.control.DropDown
        StainclassDropDownLabel         matlab.ui.control.Label
        HEImageNameDropDown             matlab.ui.control.DropDown
        HEimagenameLabel                matlab.ui.control.Label
        InvertYAxisCheckBox             matlab.ui.control.CheckBox
        InvertXAxisCheckBox             matlab.ui.control.CheckBox
        CellAnnotationFileVariablesLamp  matlab.ui.control.Lamp
        ValidateCellAnnotationFilesVariablesButton  matlab.ui.control.Button
        SwapnameregexsButton            matlab.ui.control.Button
        FileLoadingPanel                matlab.ui.container.Panel
        SelecttumorlabelmasksButton     matlab.ui.control.Button
        SelectcellannotationsButton     matlab.ui.control.Button
        SelectGLASSAIclassificationsButton  matlab.ui.control.Button
        UITable                         matlab.ui.control.Table
        StainNameEditField              matlab.ui.control.EditField
        StainNameEditFieldLabel         matlab.ui.control.Label
        OutputFolderLabel               matlab.ui.control.TextArea
        SelectOutputFolder              matlab.ui.control.Button
        WorkflowButtonGroup             matlab.ui.container.ButtonGroup
        AppIcon                         matlab.ui.control.Image
        VersionLabel                    matlab.ui.control.Label
        CopytobaseButton                matlab.ui.control.Button
        RunButton                       matlab.ui.control.Button
        FileLoadingButton               matlab.ui.control.ToggleButton
        PeritumorAnalysisSettingsButton  matlab.ui.control.ToggleButton
        CustomizeStainThresholdsButton  matlab.ui.control.ToggleButton
        ColumnAssignmentButton          matlab.ui.control.ToggleButton
        UITableContextMenu              matlab.ui.container.ContextMenu
        UnselectMenu                    matlab.ui.container.Menu
        ClearMenu                       matlab.ui.container.Menu
        ClearSelection                  matlab.ui.container.Menu
        ClearRows                       matlab.ui.container.Menu
        ClearColumns                    matlab.ui.container.Menu
        ClearInvalidFiles               matlab.ui.container.Menu
        ChangeFolderMenu                matlab.ui.container.Menu
        PopulatefromFolderMenu          matlab.ui.container.Menu
    end


    properties (Access = public)
        %versioning
        STAINED_GLASS_AI_VERSION = "0.1"

        %file navigation
        LAST_SELECTED_DIR % store last directory selected for quicker navigation
        START_DIR %only used in non-deployed environment
        RESOURCE_DIR_PATH
        

        %GLASS-AI annotations
        SELECTED_GLASSAI_ANNOTATION_FILE_NAME % store list of selected GLASS-AI annotation files
        GLASSAI_ANNOTATION_FULLFILE_PATH % path to file containing GLASS-AI predictions
        GLASSAI_ANNOTATION_MATFILE % store matfile i/o connection for GLASS-AI annotation file
        GLASSAI_ANNOTATION_CLASS_NAMES = [  "Grade 1 LUAD",...  %1 - green          [000 255 000]   tumor
                                            "Grade 2 LUAD",...  %2 - blue           [000 000 255]   tumor
                                            "Grade 3 LUAD",...  %3 - yellow         [255 255 000]   tumor
                                            "Grade 4 LUAD",...  %4 - red            [255 000 000]   tumor
                                            "Grade 5 LUAD",...  %8 - light purple   [150 110 210]   tumor
                                            "Alveoli",...       %5 - cyan           [000 255 255]   normal
                                            "Airway",...        %6 - magenta        [255 000 255]   normal
                                            "Background"];      %7 - white          [255 255 255]   background
        GLASSAI_ANNOTATION_CLASS_VALUES = [1 2 3 4 8 5 6 7];
        GLASSAI_ANNOTATION_CLASS_RGB = [000 255 000; % green        Grade 1 LUAD    tumor
                                        000 000 255; % blue         Grade 2 LUAD    tumor
                                        255 255 000; % yellow       Grade 3 LUAD    tumor
                                        255 000 000; % red          Grade 4 LUAD    tumor
                                        000 255 255; % cyan         Alveoli         normal
                                        255 000 255; % magenta      Airway          normal
                                        255 255 255; % white        Background      background
                                        150 110 210] % light purple Grade 5 LUAD    tumor

        %stained cell annotations
        CELL_IMPORT_OPTS %store import options for consistent importing across files
        SELECTED_CELL_ANNOTATION_FILE_NAME_LIST % store list of selected cell annotation files
        CELL_ANNOTATION_FILE_PATH % path to directory containing selected cell annotation files
        CELL_ANNOTATION_FULLFILE_PATH % path to file containing cell annotations
        PREVIEW_CELLTABLE % store cell table for updating variables
        ECDF_INTENSITIES % store stain intensities in a 1-by-n vector
        STAIN_NAME % name of the stain to add to outputs
        STAIN_CLASS_NAME_LIST % store a list of the unique names used in stain classes
        HSCORE_VALUES % store the list of H-Score values to use for each stain class

        %labeled tumor mask
        SELECTED_LABELED_TUMOR_MASK_FILE_NAME %store file name for labeled tumor mask
        LABELED_TUMOR_MASK_FULLFILE_PATH %store path to directory containing selected labeled tumor mask
        LABELED_TUMOR_MASK_MATFILE % store matfile i/o connection for labeled tumor mask
        LABELED_TUMOR_MASK_SCALE % ratio of labeled tumor mask size to GLASS-AI annotation dimensions
        
        %background image for cell overlay
        BACKGROUND_IMAGE_FILE_PATH % path to image for overlaying cells
        BACKGROUND_IMAGE_FILE_NAME % path to image for overlaying cells
        BACKGROUND_IMAGE % store RGB image for overlaying cells and peritumor analysis
        BACKGROUND_IMAGE_INDEX % image layer of background image that matches GLASS-AI annotation dimensions

        %peritumor analysis
        DEMO_IMAGE %store RGB image of H&E stained tumors for peritumor demo
        DEMO_MASK %store binary mask for peritumor demo
        DEMO_SHORE_MASK %store label maks for peritumor demo
        SHORE_INTERVALS %store interval cutoffs for peritumor analysis

        %output
        OUTPUT_FOLDER_PATH % directory where ouptut files will be placed

        %file validation
        ALL_FILES_VALIDATED = false;
        STAIN_VARIABLES_VALIDATED = false % Have stain variables been validated in all files
        STAIN_VARIABLES_VALIDATION_TABLE % Table to store stain variable validation results
        HE_IMAGE_NAMES % Image names for the H&E stain to match with GLASS-AI annotation file
        STAIN_IMAGE_NAMES % Image names for the IHC stain
        ANNOTATION_FILE_PAIRING_VALIDATED = false % was the GLASS-AI annotation file matched to the H&E image name in each file
        TUMOR_LABEL_MASK_VALIDATED = false %Are GLASS-AI annotation file and labeled tumor mask the same dimensions
        BACKGROUND_IMAGE_VALIDATED  % does background image match dimensions of GLASS-AI annotations
    end



    methods (Access = private)

        function versioncheck(app)
            % Check for updated version of the standalone app on Github.
            %- Look in the raw code of the main branch for the version
            %- property. Extract using regexexp and compare to version
            %- property in this application

            try 
                if strfind(app.GLASSAI_EDITOR_APP_VERSION,"dev")
                    % do nothing
                else
                    %% check app version on Github
                    % fetch current version of the app code from GitHub
                    gitData = webread("https://raw.githubusercontent.com/jlockhar/GLASS-AI-annotation-editor/main/GLASS_AI_annotation_editor.m");
                    % extract version property and parse into major minor patch
                    versionPattern = regexpPattern("(?<=GLASSAI_EDITOR_APP_VERSION \= \')([0-9\.]+)(?=\')");
                    gitVersion = string(extract(gitData,versionPattern));
                    % put GitHub version in app version tooltip
                    app.VersionLabel.Tooltip = sprintf("%s: %s\n","Current GLASS-AI annotation editor app version on GitHub",gitVersion);
                    % parse major.minor.patch version from GitHub version
                    gitVersionMajor = extract(gitVersion,regexpPattern("(?<=^)[0-9]+(?=\.)"));
                    gitVersionMinor = extract(gitVersion,regexpPattern("(?<=^[0-9]+\.)[0-9]+(?=\.)"));
                    gitVersionPatch = extract(gitVersion,regexpPattern("(?<=^[0-9]+\.[0-9]+\.)[0-9]+(?=$)"));

                    %% check version of the local app
                    % parse major.minor.patch version from local app
                    appVersionMajor = extract(app.GLASSAI_EDITOR_APP_VERSION,regexpPattern("(?<=^)[0-9]+(?=\.)"));
                    appVersionMinor = extract(app.GLASSAI_EDITOR_APP_VERSION,regexpPattern("(?<=^[0-9]+\.)[0-9]+(?=\.)"));
                    appVersionPatch = extract(app.GLASSAI_EDITOR_APP_VERSION,regexpPattern("(?<=^[0-9]+\.[0-9]+\.)[0-9]+(?=$)"));

                    %% compare version and prompt for update
                    % compare version numbers
                    majorUpdateAvailable = str2double(appVersionMajor) < str2double(gitVersionMajor);
                    minorUpdateAvailable = ~majorUpdateAvailable & str2double(appVersionMinor) < str2double(gitVersionMinor);
                    patchUpdateAvailable = ~majorUpdateAvailable & ~minorUpdateAvailable & str2double(appVersionPatch) < str2double(gitVersionPatch);

                    % prompt user to update the app if local version is behind GitHub
                    if majorUpdateAvailable
                        app.UpdateAvailableButton.BackgroundColor = [1 0 0];
                        app.UpdateAvailableButton.Tooltip = sprintf("A major version update (%s) is available for the GLASS-AI annotation editor! Click to get the installer for the latest version.",gitVersion);
                        app.UpdateAvailableButton.Visible = "on";
                        app.UpdateAvailableButton.Enable = "on";
                    elseif minorUpdateAvailable
                        app.UpdateAvailableButton.BackgroundColor = [1 1 0];
                        app.UpdateAvailableButton.Tooltip = sprintf("A minor version update (%s) is available for the GLASS-AI annotation editor! Click to get the installer for the latest version.",gitVersion);
                        app.UpdateAvailableButton.Visible = "on";
                        app.UpdateAvailableButton.Enable = "on";
                    elseif patchUpdateAvailable
                        app.UpdateAvailableButton.BackgroundColor = [0 1 1];
                        app.UpdateAvailableButton.Tooltip = sprintf("A patch update (%s) is available for the GLASS-AI annotation editor! Click to get the installer for the latest version.",gitVersion);
                        app.UpdateAvailableButton.Visible = "on";
                        app.UpdateAvailableButton.Enable = "on";
                    else %app.GLASSAI_EDITOR_APP_VERSION == gitVersion
                        %don't do anything if this is the latest version
                    end
                end %if strfind(app.GLASSAI_EDITOR_APP_VERSION,"dev")
            catch ME
                app.VersionLabel.Tooltip = "Could not check app version on GitHub";
                % report error in non-deployed environment
                sprintf("Could not check app version against GitHub:\n %s\n",ME.message)
            end %try
        end %End function: versioncheck
        
        function main(app)

            processingStyle = uistyle("BackgroundColor",[173/255 203/255 226/255]);
            completedStyle = uistyle("BackgroundColor", [197/255 230/255 127/255]);
            errorStyle = uistyle("BackgroundColor",     [185/255 101/255 108/255]);
            for fileTableRow = 1:size(app.UITable.Data,1)
                % get file names and paths from table
                % use column name instead of index for future-proofing
                currentCellAnnotationFileName = retrieveUITableData(app,fileTableRow,"Cell Annotation(s)");
                currentCellAnnotationFileName = currentCellAnnotationFileName{1};

                currentCellAnnotationFilePath = retrieveUITableData(app,fileTableRow,"CellAnnotationPath");
                currentCellAnnotationFilePath = currentCellAnnotationFilePath{1};

                currentGLASSAIAnnotationFileName = retrieveUITableData(app,fileTableRow,"GLASS-AI Results");
                currentGLASSAIAnnotationFileName = currentGLASSAIAnnotationFileName{1};

                currentGLASSAIAnnotationFilePath = retrieveUITableData(app,fileTableRow,"ClassificationPath");
                currentGLASSAIAnnotationFilePath = currentGLASSAIAnnotationFilePath{1};

                currentTumorLabelMaskFileName = retrieveUITableData(app,fileTableRow,"Tumor Label Mask");
                currentTumorLabelMaskFileName = currentTumorLabelMaskFileName{1};

                currentTumorLabelMaskFilePath = retrieveUITableData(app,fileTableRow,"TumorLabelMaskPath");
                currentTumorLabelMaskFilePath = currentTumorLabelMaskFilePath{1};


                app.CELL_ANNOTATION_FULLFILE_PATH = fullfile(currentCellAnnotationFilePath,currentCellAnnotationFileName);
                
                app.GLASSAI_ANNOTATION_FULLFILE_PATH = fullfile(currentGLASSAIAnnotationFilePath,currentGLASSAIAnnotationFileName);

                app.LABELED_TUMOR_MASK_FULLFILE_PATH = fullfile(currentTumorLabelMaskFilePath,currentTumorLabelMaskFileName);
                
                
                try
                    addStyle(app.UITable,processingStyle,"row",fileTableRow);
                    drawnow
                    runstainglassanalysis(app);
                    addStyle(app.UITable,completedStyle,"row",fileTableRow);
                    drawnow
                catch ME
                    addStyle(app.UITable,errorStyle,"row",fileTableRow);
                    drawnow
                    message_text = "Encountered an unexpected error." + ...
                        newline + "[ERROR MESSAGE]" + newline + ME.message +...
                        newline + "See logfile for details.";
                    uialert(app.UIFigure,message_text,"Unexpected error")
                end
                
            end
            
            uialert(app.UIFigure,"Processing complete","DONE",'Icon',"success")
        end %function: main

        function runstainglassanalysis(app)
            %load GLASS-AI annotations and labeled tumor mask from Matfiles
            app.GLASSAI_ANNOTATION_MATFILE = load(app.GLASSAI_ANNOTATION_FULLFILE_PATH);
            annotationFieldName = fieldnames(app.GLASSAI_ANNOTATION_MATFILE);
            tumorAnnotations = app.GLASSAI_ANNOTATION_MATFILE.(annotationFieldName{1});
            statusupdate(app,"Loaded GLASS-AI annotations from Matfile")

            app.LABELED_TUMOR_MASK_MATFILE = load(app.LABELED_TUMOR_MASK_FULLFILE_PATH);
            tumorMaskFieldName = fieldnames(app.LABELED_TUMOR_MASK_MATFILE);
            labeledTumorMask = app.LABELED_TUMOR_MASK_MATFILE.(tumorMaskFieldName{1});
            statusupdate(app,"Loaded labeled tumor mask from Matfile")

            %resize tumor mask to match annotations dimensions
            if app.LABELED_TUMOR_MASK_SCALE ~= 1
               labeledTumorMask = imresize(labeledTumorMask,1/app.LABELED_TUMOR_MASK_SCALE,Method="nearest");
                statusupdate(app,"Resized labeled tumor mask to match GLASS-AI annotation dimensions")
            end
            
            
            % get tumor centroid coordinates and convert to nx2 matrix of [x y]
            % coordinates
            tumorCentroids = regionprops(labeledTumorMask > 0,"Centroid");
            tumorCentroids = uint32(cat(1,tumorCentroids.Centroid));
            statusupdate(app,"Calculated tumor centroids")
            % get areas of each tumor
            tumorAreas = regionprops(labeledTumorMask > 0,"Area");
            tumorAreas = [tumorAreas.Area]' * (0.5022^2);
            statusupdate(app,"Calculated tumor areas")

            % get cell annotations from all selected files
            cellAnnotations = makecellannotationtable(app);

            % make new stain classes if requested
            if ~isempty(app.StainIntensityDropDown.Value) && app.UseCustomThesholdCheckBox.Value
                cellAnnotations = applycustomintensitythresholds(app,cellAnnotations);
            end
            
            %append stain name to stain classes
            cellAnnotations.("Stain Class") = append(app.STAIN_NAME, " : ", cellAnnotations.("Stain Class"));
            app.STAIN_CLASS_NAME_LIST = string(append(app.STAIN_NAME, ' : ', app.StainClassNamesTextArea.Value))'; %transposed to horizontal vector
            statusupdate(app,sprintf("Appended '%s :' to stain class names",app.STAIN_NAME))

            % convert coordinates to pixel coordinates. invert axes if requested
            cellAnnotations = convertcoordinatestopixels(app,cellAnnotations);

            % convert coordinates to vectorized indices
            cellIndices = sub2ind(size(tumorAnnotations),cellAnnotations.("Y Position in pixels"),cellAnnotations.("X Position in pixels"));
            statusupdate(app,"Indexed cell coordinates")    
            % get grades and tumor IDs for each cell
            cellAnnotations.Grade = tumorAnnotations(cellIndices);
            cellAnnotations.TumorID = labeledTumorMask(cellIndices);
            
            % if cell is in a tumor add that as nearest tumor and set
            % distance = 0
            cellAnnotations.NearestTumor = cellAnnotations.TumorID .* uint16(cellAnnotations.TumorID > 0);
            cellAnnotations.DistanceToNearestTumor(find(cellAnnotations.TumorID > 0)) = 0;
            % set the distances of cells outside of tumors to NaN so that cells outside of
            % peritumor analysis are flagged when finished. uint numbers
            % like those in TumorID and NearestTumor can't be set to NaN.
            % Leave as 0 instead.
            cellAnnotations.DistanceToNearestTumor(find(cellAnnotations.TumorID == 0)) = NaN;
            statusupdate(app,"Assigned cells in tumors to those tumors")

            % make table for tumor analyis results
            tumorStainingStatsTable = initializetumorstainstatstable(app,length(tumorCentroids));
            % fill in the information columns
            tumorStainingStatsTable.("H&E Slide ID")(:) = cellAnnotations.('H&E Slide ID'){1};
            tumorStainingStatsTable.("Stain Slide ID")(:) = cellAnnotations.('Stain Slide ID'){1};
            tumorStainingStatsTable.("Tumor ID") = [1:length(tumorCentroids)]';
            tumorStainingStatsTable.("Tumor Area in sq. micron") = tumorAreas;
            tumorStainingStatsTable.("Centroid X position in pixels") = tumorCentroids(:,1);
            tumorStainingStatsTable.("Centroid Y position in pixels") = tumorCentroids(:,2);
            statusupdate(app,"Filled static columns in tumor staining stats table")
            
            % analyze cells in tumors
            [tumorStainingStatsTable, cellAnnotations] = analyzeindividualtumors(app, tumorStainingStatsTable, cellAnnotations);
            tumorStainedProportions = calculatstaincellproportions(app,tumorStainingStatsTable);
            tumorStainingStatsTable.("H-score") = calculatehscore(app,tumorStainedProportions);
            tumorStainingStatsTable.("IRS") = calculateirs(app,tumorStainedProportions);

            % analyze cells in peritumor regions if requested
            % app.SHORE_INTERVALS length will == 1 if no inputs provided
            if length(app.SHORE_INTERVALS) > 1
                [tumorStainingStatsTable, cellAnnotations] = analyzeperitumorregions(app, tumorStainingStatsTable, labeledTumorMask, cellAnnotations);
            end

            tumorStainingTableOutFileName = sprintf("%s %s tumor staining stats.xlsx",cellAnnotations.('H&E Slide ID'){1}, app.STAIN_NAME);
            writetable(tumorStainingStatsTable,fullfile(app.OUTPUT_FOLDER_PATH,tumorStainingTableOutFileName));
            statusupdate(app,"Saved tumor staining stats table to file.")
            cellAnnotationTableOutFileName = sprintf("%s %s cell annotations.csv",cellAnnotations.('H&E Slide ID'){1}, app.STAIN_NAME);
            writetable(cellAnnotations,fullfile(app.OUTPUT_FOLDER_PATH, cellAnnotationTableOutFileName));
            statusupdate(app,"Saved cell annotations to file.")


            %TODO
            %-add cell overlay for H&E image, stained image
            if ~isempty(app.BACKGROUND_IMAGE_FILE_NAME)
                backgroundImage = imread(fullfile(app.BACKGROUND_IMAGE_FILE_PATH, app.BACKGROUND_IMAGE_FILE_NAME),'Index',app.BACKGROUND_IMAGE_INDEX);
                statusupdate(app,"Loaded background image from file.")
                [~, outputImageName, ~] = fileparts(app.BACKGROUND_IMAGE_FILE_NAME);
                
                cellAnnotationOverlayImage = addcelloverlaytoimage(app,backgroundImage,cellAnnotations);
                statusupdate(app,"Created cell overlay on background image.")
                writetiff(app,cellAnnotationOverlayImage,sprintf("%s_cell_overlay.tif",outputImageName));
                statusupdate(app,"Saved cell overlay image to file.")
                clear cellAnnotationOverlayImage

                if length(app.SHORE_INTERVALS) > 1
                    shoreMask = generateperitumorshoremask(app,labeledTumorMask);
                    statusupdate(app,"Made peritumor shore mask for analysis.")
                    peritumorAnnotationOverlayImage = labeloverlay(backgroundImage, shoreMask, Colormap = colormap(app.PeritumorDemoAxes), Transparency = app.PeritumorTranparencySlider.Value);
                    statusupdate(app,"Overlayed peritumor shore mask on background image.")
                    peritumorAnnotationOverlayImage = addcelloverlaytoimage(app,peritumorAnnotationOverlayImage,cellAnnotations);
                    statusupdate(app,"Overlayed cells on peritumor masked background image.")
                    writetiff(app,peritumorAnnotationOverlayImage,sprintf("%s_peritumor_overlay.tif",outputImageName));
                    statusupdate(app,"Saved background image with overlayed peritumor shores and cells.")
                    clear peritumorAnnotationOverlayImage
                end
                clear backgroundImage
            end
            
        end

        function gradeImage = createtumorgradeimage(~, classifications)
            % make tumor grade image from classifications
            %initialize gradeImage RGB arrays
            [classificationsWidth,classificationsHeight] = size(classifications);
            ch1 = zeros(classificationsWidth,classificationsHeight, 'uint8');
            ch2 = zeros(classificationsWidth,classificationsHeight, 'uint8');
            ch3 = zeros(classificationsWidth,classificationsHeight, 'uint8');

            % Ignored ROIS, black
            %- can skip since initialized as 0
            %Inds = classifications==0;
            %ch1(Inds) = 0;
            %ch2(Inds) = 0;
            %ch3(Inds) = 0;
            %

            % Grade 1, green
            Inds = classifications==1;
            ch1(Inds) = 0;
            ch2(Inds) = 255;
            ch3(Inds) = 0;

            %Grade 2, blue
            Inds = classifications==2;
            ch1(Inds) = 0;
            ch2(Inds) = 0;
            ch3(Inds) = 255;

            % Grade 3, yellow
            Inds = classifications==3;
            ch1(Inds) = 255;
            ch2(Inds) = 255;
            ch3(Inds) = 0;

            % Grade 4, red
            Inds = classifications==4;
            ch1(Inds) = 255;
            ch2(Inds) = 0;
            ch3(Inds) = 0;

            % Grade 5, light purple
            Inds = classifications==8;
            ch1(Inds) = 150;
            ch2(Inds) = 110;
            ch3(Inds) = 210;

            % Alveoli, cyan
            Inds = classifications==5;
            ch1(Inds) = 0;
            ch2(Inds) = 255;
            ch3(Inds) = 255;

            % Airways, magenta
            Inds = classifications==6;
            ch1(Inds) = 255;
            ch2(Inds) = 0;
            ch3(Inds) = 255;

            % Background/void, white
            Inds = classifications==7;
            ch1(Inds) = 255;
            ch2(Inds) = 255;
            ch3(Inds) = 255;

            %merge channels to create RGB image
            gradeImage = cat(3,ch1,ch2,ch3);
            %convert to uint8 to reduce size
            gradeImage = uint8(gradeImage);

        end %end function: createtumorgradeimage

        function  writetiff(app,AppIcon,filename)
            %write tiff files with metadata

            bt = Tiff(fullfile(app.OUTPUT_FOLDER_PATH, filename),'w8');
            tags.ImageLength         = size(Image,1);
            tags.ImageWidth          = size(Image,2);
            tags.Photometric         = Tiff.Photometric.RGB;
            tags.BitsPerSample       = 8;
            tags.SamplesPerPixel     = size(Image,3);
            tags.TileWidth           = 128;
            tags.TileLength          = 128;
            tags.Compression         = Tiff.Compression.JPEG;
            tags.PlanarConfiguration = Tiff.PlanarConfiguration.Chunky;
            tags.Software            = 'MATLAB/GLASS-AI/Stained-GLASS-AI';

            setTag(bt, tags);
            write(bt, Image);
            close(bt);
        end


        function updatecellannotationvariablenames(app,inputColumnNames)
            %initialize storage for names of variables that get reset
            cellAnnotationVariablesReset = [];

            % Variable: H&E Image Name
            expectedHEImageNameVars = {'scene_name','Image','h_e_image','H&E Image'};
            app.HEImageNameDropDown.Items = ['' inputColumnNames];
            
            % store current value or reset if needed
            currentValue = '';         
            if isempty(app.HEImageNameDropDown.Value) %if not already defined
                % automatically set to expected variable if it exists
                HEImageNameVarPos = find(matches(inputColumnNames,expectedHEImageNameVars));
                    if not(isempty(HEImageNameVarPos))
                        currentValue = inputColumnNames(HEImageNameVarPos);
                    end
            else 
                currentValue = app.HEImageNameDropDown.Value; %keep current
                %reset if current variable not in new list of variable names
                if sum(matches(inputColumnNames,app.HEImageNameDropDown.Value)) == 0
                    cellAnnotationVariablesReset = [cellAnnotationVariablesReset "H&E Image Name"];
                    currentValue = '';
                end
            end
            
            %set dropdown value and run regex
            app.HEImageNameDropDown.Value = currentValue;
            runheimagenameregex(app);

            % Variable: Stain Image Name
            % store current value or reset if needed
            expectedStainImageNameVars = {'scene_name','Image','stain_image','Stain Image'};
            app.StainImageNameDropDown.Items = ['' inputColumnNames];
            
            % store current value or reset if needed
            currentValue = '';         
            if isempty(app.StainImageNameDropDown.Value) %if not already defined
                % automatically set to expected variable if it exists
                StainImageNameVarPos = find(matches(inputColumnNames,expectedStainImageNameVars));
                    if not(isempty(StainImageNameVarPos))
                        currentValue = inputColumnNames(StainImageNameVarPos);
                    end
            else 
                currentValue = app.StainImageNameDropDown.Value; %keep current
                %reset if current variable not in new list of variable names
                if sum(matches(inputColumnNames,app.StainImageNameDropDown.Value)) == 0
                    cellAnnotationVariablesReset = [cellAnnotationVariablesReset "Stain Image Name"];
                    currentValue = '';
                end
            end
            
            %set dropdown value and run regex
            app.StainImageNameDropDown.Value = currentValue;
            runstainimagenameregex(app);

            % Variable: Stain Class
            % automatically set to expected variable if it exists
            expectedStainClassVars = {'class_name','Classification','stain_class','Stain Class'};
            app.StainClassDropDown.Items = ['' inputColumnNames];
            % store current value or reset if needed
            currentValue = '';         
            if isempty(app.StainClassDropDown.Value) %if not already defined
                % automatically set to expected variable if it exists
                StainClassVarPos = find(matches(inputColumnNames,expectedStainClassVars));
                    if not(isempty(StainClassVarPos))
                        currentValue = inputColumnNames(StainClassVarPos);
                    end
            else 
                currentValue = app.StainClassDropDown.Value; %keep current
                %reset if current variable not in new list of variable names
                if sum(matches(inputColumnNames,app.StainClassDropDown.Value)) == 0
                    cellAnnotationVariablesReset = [cellAnnotationVariablesReset "Stain Class"];
                    currentValue = '';
                end
            end
            
            %set dropdown value
            app.StainClassDropDown.Value = currentValue;
            
            % get list of unique stain classes in preview file
            stainClassNames = unique(app.PREVIEW_CELLTABLE.(app.StainClassDropDown.Value));
            %append to existing names
            app.StainClassNamesTextArea.Value = [app.StainClassNamesTextArea.Value; stainClassNames];
            %clean up stain class names
            arrangestainclassnames(app);

            % Variable: Stain Intensity
            % automatically set to expected variable if it exists
            expectedStainIntensityVars = {'Brown Chromogen Intensity','Nucleus: DAB OD mean','Cell: DAB OD mean'};
            app.StainIntensityDropDown.Items = ['' inputColumnNames];
            % store current value or reset if needed
            currentValue = '';         
            if isempty(app.StainIntensityDropDown.Value) %if not already defined
                % automatically set to expected variable if it exists
                StainIntensityVarPos = find(matches(inputColumnNames,expectedStainIntensityVars));
                    if not(isempty(StainIntensityVarPos))
                        currentValue = inputColumnNames(StainIntensityVarPos);
                    end
            else 
                currentValue = app.StainIntensityDropDown.Value; %keep current
                %reset if current variable not in new list of variable names
                if sum(matches(inputColumnNames,app.StainIntensityDropDown.Value)) == 0
                    cellAnnotationVariablesReset = [cellAnnotationVariablesReset "Stain Intensity"];
                    currentValue = '';
                end
            end
            
            %set dropdown value
            app.StainIntensityDropDown.Value = currentValue;

            % Variable: X Position
            % automatically set to expected variable if it exists
            expectedXPositionVars = {'Centroid X px'};
            app.XPositionDropDown.Items = ['' inputColumnNames];
            % store current value or reset if needed
            currentValue = '';         
            if isempty(app.XPositionDropDown.Value) %if not already defined
                % automatically set to expected variable if it exists
                XPositionVarPos = find(matches(inputColumnNames,expectedXPositionVars));
                    if not(isempty(XPositionVarPos))
                        currentValue = inputColumnNames(XPositionVarPos);
                    end
            else 
                currentValue = app.XPositionDropDown.Value; %keep current
                %reset if current variable not in new list of variable names
                if sum(matches(inputColumnNames,app.XPositionDropDown.Value)) == 0
                    cellAnnotationVariablesReset = [cellAnnotationVariablesReset "X Position"];
                    currentValue = '';
                end
            end
            
            % set dropdown value
            app.XPositionDropDown.Value = currentValue;

            % Variable: Y Position
            % automatically set to expected variable if it exists
            expectedYPositionVars = {'Centroid Y px'};
            app.YPositionDropDown.Items = ['' inputColumnNames];
            % store current value or reset if needed
            currentValue = '';         
            if isempty(app.YPositionDropDown.Value) %if not already defined
                % automatically set to expected variable if it exists
                YPositionVarPos = find(matches(inputColumnNames,expectedYPositionVars));
                    if not(isempty(YPositionVarPos))
                        currentValue = inputColumnNames(YPositionVarPos);
                    end
            else 
                currentValue = app.YPositionDropDown.Value; %keep current
                %reset if current variable not in new list of variable names
                if sum(matches(inputColumnNames,app.YPositionDropDown.Value)) == 0
                    cellAnnotationVariablesReset = [cellAnnotationVariablesReset "Y Position"];
                    currentValue = '';
                end
            end
            
            % set dropdown value
            app.YPositionDropDown.Value = currentValue;
            
            % reset variables as needed after changing file
            if ~isempty(cellAnnotationVariablesReset)
                % add bullet and seperate into multiple lines
                cellAnnotationVariablesReset = append(char(8226)+ " ", cellAnnotationVariablesReset);
                cellAnnotationVariablesReset = sprintf("\n%s", cellAnnotationVariablesReset);
                %create uialert to show which variables have been reset
                variableRestAlertMessage = sprintf("The following columns were not found in the selected file and were reset:%s",cellAnnotationVariablesReset);
                uialert(app.UIFigure,variableRestAlertMessage,"Missing values","Icon","warning")
            end

            resetvalidationchecks(app)
        end %% function: updatecellannotationvariablenames

        function runheimagenameregex(app)
            value = app.HEImageNameDropDown.Value;
            if ~isempty(app.HEImageNameDropDown.Value)
                testString = string(table2cell(app.PREVIEW_CELLTABLE(1,value)));
                if ~isempty(app.HEImageNameRegexEditField.Value)
                    regexResult = extract(testString,regexpPattern(app.HEImageNameRegexEditField.Value));
                    if isempty(regexResult)
                        app.HERegexResultEditField.Value = 'No matches!';
                    else
                        app.HERegexResultEditField.Value = regexResult;
                    end % isempty(regexResult)
                else
                    app.HERegexResultEditField.Value = testString;
                end % ~isempty(app.HEImageNameRegexEditField.Value)
            else
                app.HERegexResultEditField.Value = '';
            end % ~isempty(app.HEImageNameDropDown.Value)
        end %function: runheimagenameregex

        function runstainimagenameregex(app)
            value = app.StainImageNameDropDown.Value;
            if ~isempty(app.StainImageNameDropDown.Value)
                testString = string(table2cell(app.PREVIEW_CELLTABLE(1,value)));
                if ~isempty(app.StainImageNameRegexEditField.Value)
                    regexResult = extract(testString,regexpPattern(app.StainImageNameRegexEditField.Value));
                    if isempty(regexResult)
                        app.StainRegexResultEditField.Value = 'No matches!';
                    else
                        app.StainRegexResultEditField.Value = regexResult;
                    end % isempty(regexResult)
                else
                    app.StainRegexResultEditField.Value = testString;
                end %~isempty(app.StainImageNameRegexEditField.Value)
            else
                app.StainRegexResultEditField.Value = '';
            end % ~isempty(app.StainImageNameDropDown.Value)
        end %function: runstainimagenameregex

        function updatestainecdfplot(app)
            % plot emperical cumulative frequency if stain intensity is defined
            % requires the Matlab Statistics and Machine Learning Toolbox
            if ~isempty(app.StainIntensityDropDown.Value)
                cla(app.StainECDFAxes)
                cdfHandle = cdfplot(app.ECDF_INTENSITIES);
                cdfHandle.Parent = app.StainECDFAxes;
                cdfHandle.LineWidth = 2;
                close

                % add lines to show user-defined thesholds
                if ~isempty(app.StainThresholdsEditField.Value)
                    ecdfStainThresholds = str2num(app.StainThresholdsEditField.Value);
                    if ~isempty(app.StainClassNamesTextArea.Value)
                        ecdfStainClassNames = app.StainClassNamesTextArea.Value;
                    else
                        ecdfStainClassNames = {' '};
                    end

                    % add empty labels if needed
                    missingLabelCount = length(ecdfStainThresholds)+1 - length(ecdfStainClassNames);
                    if missingLabelCount > 0
                        for iMissingLabel = 1:missingLabelCount
                            ecdfStainClassNames{end+1} = ' ';
                        end
                    end
                    %remove extra labels that don't have thresholds
                    if missingLabelCount < 0
                        ecdfStainClassNames = ecdfStainClassNames(1:end+missingLabelCount);
                    end

                    % add percent of cells in each class
                    ecdfPercentiles = calculateecdfpercentiles(app,ecdfStainThresholds);
                    ecdfStainClassLabels = strcat(string(ecdfPercentiles),string(ecdfStainClassNames));

                    % add labled lines to plot. First label on the left, the
                    % rest on the right of the lines.

                    xline(app.StainECDFAxes,ecdfStainThresholds(1),'-r',ecdfStainClassLabels(1),'LabelHorizontalAlignment','left')
                    xline(app.StainECDFAxes,ecdfStainThresholds(:),'-r',ecdfStainClassLabels(2:end),'LabelHorizontalAlignment','right')

                end
            end
        end % function: updatestanecdfplot


        function ecdfpercentiles = calculateecdfpercentiles(app,thresholds)
            ecdfpercentiles = cell(length(thresholds)+1,1);
            totalCells = length(app.ECDF_INTENSITIES);
            cappedThresholds = sort([min(app.ECDF_INTENSITIES)-1 thresholds max(app.ECDF_INTENSITIES)+1]);
            for iThreshold = 2:length(thresholds)+2
                testVal =  cappedThresholds(iThreshold-1) < app.ECDF_INTENSITIES & app.ECDF_INTENSITIES < cappedThresholds(iThreshold);
                ecdfpercentiles{iThreshold-1} = sprintf("(%0.2f%%) ", 100*nnz(testVal)/totalCells);
            end

        end % function: calculateecdfpercentiles

        function resetvalidationchecks(app)
            app.STAIN_VARIABLES_VALIDATED = false;
            app.ValidateCellAnnotationFilesVariablesButton.Enable = "on";
            readytoruncheck(app)
        end % function: resetvalidationchecks

        function readytoruncheck(app)
            if app.STAIN_VARIABLES_VALIDATED && app.ALL_FILES_VALIDATED
                app.RunButton.Enable = "on";
            else
                app.RunButton.Enable = "off";
            end
        end % function: readytoruncheck

        
        function cellAnnotations = applycustomintensitythresholds(app, cellAnnotations)
                %apply custom thresholds to make new stain classes
                iThreshold = 0;
                for threshold = app.StainThresholdsEditField.Value
                    threshold = str2num(threshold);
                    iThreshold = iThreshold+1;
                    % set stain class if intensity > threshold
                    % this will change the class of high stain intensity cells
                    % multiple times until they fall below the threshold.
                    gtThreshold = cellAnnotations.('Stain Intensity') - threshold > 0;
                    cellAnnotations.('Stain Class')(gtThreshold) = string(app.StainClassNamesTextArea.Value(iThreshold+1));
                    % add lowest class below first threshold
                    if iThreshold == 1
                        cellAnnotations.('Stain Class')(~gtThreshold) = string(app.StainClassNamesTextArea.Value(1));
                    end
                end
                statusupdate(app,"Finished applying custom stain thresholds")
        end % function: applycustomintensitythresholds
        
        function cellAnnotations = convertcoordinatestopixels(app, cellAnnotations)
            % pick scaling coefficient
            switch app.PositionUnitDropDown.Value
                case 'millimeter'
                    scalingCoeff = 1000/0.5022;
                case 'micrometer'
                    scalingCoeff = 1/0.5022;
                case 'inch'
                    scalingCoeff = 25400/0.5022;
                case 'pixel'
                    % do nothing
                    scalingCoeff = 1;
                otherwise
                    scalingCoeff = 1;
            end
            % apply scaling to convert to pixel coordinates. round down to make
            % integer values.
            cellAnnotations.("X Position in pixels") = floor(cellAnnotations.("X Position") .* scalingCoeff);
            cellAnnotations.("Y Position in pixels") = floor(cellAnnotations.("Y Position") .* scalingCoeff);
            
            %invert axes if requested
            if app.InvertXAxisCheckBox.Value
                cellAnnotations.("X Position in pixels") = abs(cellAnnotations.("X Position in pixels") - whos(app.GLASSAI_ANNOTATION_MATFILE).size(2));
            end
            if app.InvertYAxisCheckBox.Value
                cellAnnotations.("Y Position in pixels") = abs(cellAnnotations.("Y Position in pixels") - whos(app.GLASSAI_ANNOTATION_MATFILE).size(1));
            end
            statusupdate(app,"Converted cell locations to pixel coordinates")
        end % function: convertcoordinatestopixels(app, cellAnnotations)
        
        function slideStainingStatsTable = initializetumorstainstatstable(app, nTumors)
        % prepare output table 
        headerNames=[   "H&E Slide ID",...              % string
                        "Stain Slide ID",...            % string
                        "Tumor ID",...                  % uint32
                        "Tumor Area in sq. micron",...      % uint32
                        "Centroid X position in pixels",...      % uint32
                        "Centroid Y position in pixels"];        % uint32 
        
        varTypes = ["string",...        % "H&E Slide ID"
                    "string",...        % "Stain Slide ID"
                    "uint32",...        % "Tumor ID"
                    "uint32",...        % "Tumor Area in sq. micron"
                    "uint32",...        % "Centroid X in pixels"
                    "uint32"];          % "Centroid Y in pixels"
            

        [tumorHeaderNames, tumorVarTypes] = maketumoranalyistableheaders(app);
        [peritumorHeaderNames, peritumorVarTypes] = makeperitumoranalyistableheaders(app);
        headerNames = [headerNames, tumorHeaderNames, peritumorHeaderNames];
        varTypes = [varTypes, tumorVarTypes, peritumorVarTypes];
        tableSize = [nTumors length(varTypes)];
        slideStainingStatsTable = table('Size',tableSize,...
            'VariableNames',headerNames,'VariableTypes',varTypes);
        statusupdate(app,"Initialized tumor staining stats table")
        end % function: initializetumorstainstatstable
        
        function [headerNames, varTypes] = maketumoranalyistableheaders(app)
            headerNames = {};
            varTypes = {};
            % add column for each annotation class and stain class]
            for qAnnotationClass = app.GLASSAI_ANNOTATION_CLASS_NAMES %is a string
                for qStainClass = app.STAIN_CLASS_NAME_LIST
                    headerNames = [headerNames, strjoin([qAnnotationClass, qStainClass,"Cell Count"])];
                    varTypes = [varTypes, "uint32"];
                end
                % add total column for each shore distance
                headerNames = [headerNames, strjoin([qAnnotationClass, "Total Cell Count"])];
                varTypes = [varTypes, "uint32"];
            end
            statusupdate(app,"Made headers for tumor stats columns in tumor staining stats table")
        end % function: maketumoranalysistableheaders

        function [headerNames, varTypes] = makeperitumoranalyistableheaders(app)
            headerNames = {};
            varTypes = {};
            % add column for each shore distance and stain class
            for shoreDistance = app.SHORE_INTERVALS(1:end-1) %skip last since it == 0
                for qStainClass = app.STAIN_CLASS_NAME_LIST %is a string
                    headerNames = [headerNames, strjoin([num2str(shoreDistance), "micron Peritumor", qStainClass, "Cell Count"])];
                    varTypes = [varTypes, "uint32"];
                end
                % add total column for each shore distance
                headerNames = [headerNames, strjoin([num2str(shoreDistance), "micron Peritumor Total Cell Count"])];
                varTypes = [varTypes, "uint32"];
            end
            statusupdate(app,"Made headers for pertumor stats columns in tumor staining stats table")
        end % function: makeperitumoranalysistableheaders
        
        function updateperitumordemo(app)
            % define color map, invert if requested
            colormap(app.PeritumorDemoAxes,app.PeritumorcolormapDropDown.Value);
            if app.InvertCheckBox.Value
                colormap(app.PeritumorDemoAxes,flipud(colormap(app.PeritumorDemoAxes)));
            end
            demoTransparency = app.PeritumorTranparencySlider.Value;

            demoOverlayImage = labeloverlay(app.DEMO_IMAGE, app.DEMO_SHORE_MASK, Colormap = colormap(app.PeritumorDemoAxes), Transparency = demoTransparency);
            imshow(demoOverlayImage, 'Parent', app.PeritumorDemoAxes);
            statusupdate(app,"Updated peritumor analysis demo")

        end

        function shoreMask = generateperitumorshoremask(app, tumorMask)

            [D, ~] = bwdist(tumorMask>0);
            statusupdate(app,"Created peritumor distance mask")
            D = D .* 0.5022; % convert from pixels to micron
            app.SHORE_INTERVALS = str2num(app.PeritumorShoreIntervalsEditField.Value);
            % add 0 as an interval distance if not already present
            if ~any(app.SHORE_INTERVALS == 0)
                app.SHORE_INTERVALS = [0 app.SHORE_INTERVALS];
            end
            app.SHORE_INTERVALS = sort(app.SHORE_INTERVALS,'descend');
            if length(app.SHORE_INTERVALS) < 5
                % make dodge multipliers using linear decrease
                shoreAdds = [255 250.-50.*(1:length(app.SHORE_INTERVALS)-1)];
            else
                % make values using scaled linear decreases
                shoreAdds = [255 250.-(200/length(app.SHORE_INTERVALS)-1).*(1:length(app.SHORE_INTERVALS)-1)];
            end
            shoreAdds = uint8(shoreAdds);
            shoreAdds = sort(shoreAdds,'ascend');

            shoreMask = zeros(size(tumorMask),'uint8');

            iDistance = 0;
            for shoreDistance = app.SHORE_INTERVALS
                %change distance to pixels from microns, rounding up
                shoreDistanceInPixels = ceil(shoreDistance / 0.5022);
                iDistance = iDistance + 1;
                intervalMask = D <= shoreDistanceInPixels;
                shoreMask(intervalMask) = shoreAdds(iDistance);
                statusupdate(app,sprintf("Made %d micron peritumor shore mask",shoreDistance))
            end
        end
           
        
        function [tumorTable, cellTable] = analyzeindividualtumors(app, tumorTable, cellTable)

            for iTumor = 1:length(tumorTable.("Tumor ID"))
                % find cells in this tumor
                tumorCells = cellTable.TumorID == iTumor;

                for qAnnotationClassValue = app.GLASSAI_ANNOTATION_CLASS_VALUES
                    % find cells of this annotation class
                    annotationCells = cellTable.Grade == qAnnotationClassValue;
                    % get the name string for the current annotation value
                    qAnnotationClassName = app.GLASSAI_ANNOTATION_CLASS_NAMES(find(app.GLASSAI_ANNOTATION_CLASS_VALUES == qAnnotationClassValue));
                    for qStainClass = app.STAIN_CLASS_NAME_LIST
                        % find cells of this stain class
                        stainCells = matches(cellTable.('Stain Class'), qStainClass);
                        % add count to total for this annotation class in this
                        % tumor
                        tumorTableColumnName = strjoin([qAnnotationClassName, qStainClass,"Cell Count"]);
                        cellCount = nnz(all([tumorCells annotationCells stainCells],2));
                        tumorTable(iTumor,tumorTableColumnName) = {cellCount};
                    end % for: stain class
                end % for: GLASS-AI annotation class
            end % for: tumorID
            statusupdate(app, "Analyzed cells in tumors")
            % calculate totals
            % get totals for each stain class in tumors
            iStainClass = 1;
            negativeCellCount = 0;
            positiveCellCount = 0;
            for qStainClass = app.STAIN_CLASS_NAME_LIST
                % find columns for each stain to sum up (i.e., not a Total
                % column)
                matchingStainClassColumns = contains(tumorTable.Properties.VariableNames, qStainClass);
                notTotalColumns = ~contains(tumorTable.Properties.VariableNames,"Total");
                tumorTableColumnName = strjoin(["Total", qStainClass,"Cell Count in Tumor"]);
                %sum across rows
                targetColumns = all([matchingStainClassColumns; notTotalColumns],1);
                sumCellCount = sum(tumorTable{:,targetColumns},2);
                tumorTable.(tumorTableColumnName) = sumCellCount;
                % consider classes with H-score == 0 as negative
                % classes with H-score >0 are positive
                % classes without H-score are ignored
                if app.HSCORE_VALUES(iStainClass) == 0
                    negativeCellCount = sumCellCount;
                elseif app.HSCORE_VALUES(iStainClass) > 0
                    positiveCellCount = positiveCellCount + sumCellCount;
                end
                iStainClass = iStainClass + 1;
            end % for: qStainClass
            % calculate the total positive and negative cell counts and use
            % them to calculate percent positive cells
            tumorTableColumnName = strjoin(["Total", "Negative","Cell Count in Tumor"]);
            tumorTable.(tumorTableColumnName) = negativeCellCount;
            tumorTableColumnName = strjoin(["Total", "Positive","Cell Count in Tumor"]);
            tumorTable.(tumorTableColumnName) = positiveCellCount;
            tumorTableColumnName = strjoin(["Percent", "Positive","Cells in Tumor"]);
            tumorTable.(tumorTableColumnName) = 100*(positiveCellCount./(positiveCellCount+negativeCellCount));
            statusupdate(app, "Calculated cell totals for each staining class")

            % get totals for each annotation class in tumors
            totalCellCount = 0;
            for qAnnotationClass = app.GLASSAI_ANNOTATION_CLASS_NAMES
                matchingGLASSAIAnnotationColumns = contains(tumorTable.Properties.VariableNames, qAnnotationClass);
                notTotalColumns = ~contains(tumorTable.Properties.VariableNames,"Total");
                %sum across rows
                sumCellCount = sum(tumorTable{:,all([matchingGLASSAIAnnotationColumns; notTotalColumns],1)},2);
                tumorTableColumnName = strjoin([qAnnotationClass, "Cell Count in Tumor"]);
                tumorTable.(tumorTableColumnName) = sumCellCount;
                totalCellCount = totalCellCount + sumCellCount;
            end
            statusupdate(app,"Calculated total cell counts in tumors for each annotation class")
            tumorTableColumnName = strjoin(["Total", "Cell Count"]);
            tumorTable.(tumorTableColumnName) = totalCellCount;
            statusupdate(app,"Finished analyzing individual tumors")
        end % function: analyzeindividualtumors


        function [tumorTable, cellTable] = analyzeperitumorregions(app, tumorTable, labeledTumorMask, cellTable)            
            
            %find largest peritumor region areas
            [D, idx] = bwdist(labeledTumorMask>0);
            statusupdate(app,"Created peritumor distance mask")
            D = D .* 0.5022; % convert from pixels to micron
            idx = reshape(idx,[numel(idx) 1]);
            idx = labeledTumorMask(idx);
            idx = reshape(idx,size(labeledTumorMask));
            idx(D>=max(app.SHORE_INTERVALS)) = 0;
            statusupdate(app,"Assigned cells to peritumor regions")

            % fill in tumor staining stats for the peritumor shores
            for qTumor = 1:height(tumorTable)
                % get subset of cells that are marked as closest to this tumor
                nearestTumorCells = cellTable.NearestTumor == qTumor;
                nearestTumorCellsTable = cellTable(nearestTumorCells, :);

                % move to next tumor if no cells found near this one
                if height(nearestTumorCellsTable) == 0
                    continue
                end

                for iShore = 2:length(app.SHORE_INTERVALS)
                    % find cells in each shore interval
                    maxShore = app.SHORE_INTERVALS(iShore -1);
                    minShore = app.SHORE_INTERVALS(iShore);
                    withinShore = nearestTumorCellsTable.DistanceToNearestTumor < maxShore & nearestTumorCellsTable.DistanceToNearestTumor >= minShore;
                    shoreCellsTable = nearestTumorCellsTable(withinShore,:);

                    % move to next shore if no cells found in this one
                    if height(shoreCellsTable) == 0
                        continue
                    end

                    % add cell count for each stain class
                    for qStainClass = app.STAIN_CLASS_NAME_LIST
                        cellCount = nnz(matches(shoreCellsTable.("Stain Class"), qStainClass));
                        tumorTableColumnName = strjoin([maxShore, "micron Peritumor", qStainClass,"Cell Count"]);
                        tumorTable(qTumor,tumorTableColumnName) = {cellCount};
                    end
                    % add total cell count for each shore interval
                    tumorTableColumnName = strjoin([maxShore, "micron Peritumor", "Total","Cell Count"]);
                    cellCount = height(shoreCellsTable);
                    tumorTable(qTumor,tumorTableColumnName) = {cellCount};
                end % for: iShore
            end % for: qTumor
            statusupdate(app,"Added peritumor stats to tumor staining table")
            statusupdate(app,"Finished analyzing peritumor regions")

        end % function: analyzeperitumorregions
        
        function stainCellProportions = calculatstaincellproportions(app, tumorTable)
            stainCellProportions = zeros([height(tumorTable) length(app.STAIN_CLASS_NAME_LIST)]);
            iStainClass = 1;
            for qStainClass = app.STAIN_CLASS_NAME_LIST
                qSTainClassTotalColumnName = strjoin(["Total" qStainClass "Cell Count in Tumor"]);
                stainCellProportions(:,iStainClass) = tumorTable.(qSTainClassTotalColumnName)./tumorTable.("Total Cell Count");
                iStainClass = iStainClass + 1;
            end
            statusupdate(app,"Calculated cell proportions in each stain class")
        end % function: calculatestaincellproportions

        function hscoreResults = calculatehscore(app,stainCellProportions)
            hscoreResults = uint16(100*sum(stainCellProportions .* app.HSCORE_VALUES,2));
            statusupdate(app,"Calculated H-score")
        end % function: calculatehscore

        function irsResults = calculateirs(app,stainCellProportions)
            % calculate IRS for each stain class in tumors
            IRS0 = 0 * (stainCellProportions == 0.00);
            IRS1 = 1 * (stainCellProportions > 0.00 & stainCellProportions < 0.10);
            IRS2 = 2 * (stainCellProportions >= 0.10 & stainCellProportions <= 0.50);
            IRS3 = 3 * (stainCellProportions > 0.50 & stainCellProportions <= 0.80);
            IRS4 = 4 * (stainCellProportions > 0.80);
            irsResults = IRS0 + IRS1 + IRS2 + IRS3 + IRS4;
            % sum across row to get tumor IRS
            irsResults = uint8(sum(irsResults .* app.HSCORE_VALUES, 2));
            %constrain to maximum of 12. Summing across rows
            %can produce values above the maximum of 12 due to the use of
            %intervals.
            irsResults =  min(irsResults, 4*(length(app.STAIN_CLASS_NAME_LIST)-1));
            statusupdate(app,"Calculated Immunoreactivity Score")
        end % function: calculateirs

        
        function outVec = horzizontalvector(~,inVec)
            % throw error if input is not a m-by-1 or 1-by-n vector
            if ~isvector(inVec)
                error("Expected input to be an m-by-1 or 1-by-n vector not a m-by-n matrix")
            end

            if size(inVec,1) > size(inVec,2)
                outVec = inVec';
            else
                outVec = inVec;
            end
        end % function: horizontalvector
        
        function statusupdate(~,inMessage)
            %format input message as string
            inMessage = string(inMessage);
            
            %add timestamp before message
            timeStamp = sprintf("%s - ",string(datetime));
            outMessage = append(timeStamp,inMessage);

            %output to console
            fprintf("%s\n",outMessage)
        end % function: statusupdate
               
        function backgroundImage = addcelloverlaytoimage(app,backgroundImage,cellAnnotations)
            ch1 = backgroundImage(:,:,1);
            ch2 = backgroundImage(:,:,2);
            ch3 = backgroundImage(:,:,3);

            if length(app.STAIN_CLASS_NAME_LIST) > 2
                positiveLevel1Class = app.STAIN_CLASS_NAME_LIST(find(app.HSCORE_VALUES == 1));
                positiveLevel1CellIndices = sub2ind(size(backgroundImage,[1 2]), ...
                    cellAnnotations.("Y Position in pixels")(cellAnnotations.("Stain Class") == positiveLevel1Class), ...
                    cellAnnotations.("X Position in pixels")(cellAnnotations.("Stain Class") == positiveLevel1Class));
                positiveLevel1CellMask = zeros(size(backgroundImage,[1 2]),'logical');
                positiveLevel1CellMask(positiveLevel1CellIndices) = 1;
                positiveLevel1CellMask = imdilate(positiveLevel1CellMask,strel('disk',6));
                ch1(positiveLevel1CellMask==1) = 200;
                ch2(positiveLevel1CellMask==1) = 200;
                ch3(positiveLevel1CellMask==1) = 200;
    
                positiveLevel2Class = app.STAIN_CLASS_NAME_LIST(find(app.HSCORE_VALUES == 2));
                positiveLevel2CellIndices = sub2ind(size(backgroundImage,[1 2]), ...
                    cellAnnotations.("Y Position in pixels")(cellAnnotations.("Stain Class") == positiveLevel2Class), ...
                    cellAnnotations.("X Position in pixels")(cellAnnotations.("Stain Class") == positiveLevel2Class));
                positiveLevel2CellMask = zeros(size(backgroundImage,[1 2]),'logical');
                positiveLevel2CellMask(positiveLevel2CellIndices) = 1;
                positiveLevel2CellMask = imdilate(positiveLevel2CellMask,strel('disk',6));
                ch1(positiveLevel2CellMask==1) = 150;
                ch2(positiveLevel2CellMask==1) = 150;
                ch3(positiveLevel2CellMask==1) = 150;
    
                positiveLevel3Class = app.STAIN_CLASS_NAME_LIST(find(app.HSCORE_VALUES == 3));
                positiveLevel3CellIndices = sub2ind(size(backgroundImage,[1 2]), ...
                    cellAnnotations.("Y Position in pixels")(cellAnnotations.("Stain Class") == positiveLevel3Class), ...
                    cellAnnotations.("X Position in pixels")(cellAnnotations.("Stain Class") == positiveLevel3Class));
                positiveLevel3CellMask = zeros(size(backgroundImage,[1 2]),'logical');
                positiveLevel3CellMask(positiveLevel3CellIndices) = 1;
                positiveLevel3CellMask = imdilate(positiveLevel3CellMask,strel('disk',6));
                ch1(positiveLevel3CellMask==1) = 100;
                ch2(positiveLevel3CellMask==1) = 100;
                ch3(positiveLevel3CellMask==1) = 100;
    
                positiveLevel3plusClass = app.STAIN_CLASS_NAME_LIST(find(app.HSCORE_VALUES == 3));
                positiveLevel3plusCellIndices = sub2ind(size(backgroundImage,[1 2]), ...
                    cellAnnotations.("Y Position in pixels")(cellAnnotations.("Stain Class") == positiveLevel3plusClass), ...
                    cellAnnotations.("X Position in pixels")(cellAnnotations.("Stain Class") == positiveLevel3plusClass));
                positiveLevel3plusCellMask = zeros(size(backgroundImage,[1 2]),'logical');
                positiveLevel3plusCellMask(positiveLevel3plusCellIndices) = 1;
                positiveLevel3plusCellMask = imdilate(positiveLevel3plusCellMask,strel('disk',6));
                ch1(positiveLevel3plusCellMask==1) = 0;
                ch2(positiveLevel3plusCellMask==1) = 0;
                ch3(positiveLevel3plusCellMask==1) = 0;
            
            else
                positiveClass = app.STAIN_CLASS_NAME_LIST(find(app.HSCORE_VALUES ~= 0));
                positiveCellsInds = sub2ind(size(backgroundImage,[1 2]), ...
                    cellAnnotations.("Y Position in pixels")(cellAnnotations.("Stain Class") == positiveClass), ...
                    cellAnnotations.("X Position in pixels")(cellAnnotations.("Stain Class") == positiveClass));
                positiveCellMask = zeros(size(backgroundImage,[1 2]),'logical');
                positiveCellMask(positiveCellsInds) = 1;
                positiveCellMask = imdilate(positiveCellMask,strel('disk',6));
                ch1(positiveCellMask==1) = 0;
                ch2(positiveCellMask==1) = 0;
                ch3(positiveCellMask==1) = 0;

            end          

            grade1CellIndices = sub2ind(size(backgroundImage,[1 2]), ...
                cellAnnotations.("Y Position in pixels")(cellAnnotations.Grade == 1), ...
                cellAnnotations.("X Position in pixels")(cellAnnotations.Grade == 1));
            grade1CellMask = zeros(size(backgroundImage,[1 2]),'logical');
            grade1CellMask(grade1CellIndices) = 1;
            grade1CellMask = imdilate(grade1CellMask,strel('disk',4));
            ch1(grade1CellMask==1) = 0;
            ch2(grade1CellMask==1) = 255;
            ch3(grade1CellMask==1) = 0;

            grade2CellIndices = sub2ind(size(backgroundImage,[1 2]), ...
                cellAnnotations.("Y Position in pixels")(cellAnnotations.Grade == 2), ...
                cellAnnotations.("X Position in pixels")(cellAnnotations.Grade == 2));
            grade2CellMask = zeros(size(backgroundImage,[1 2]),'logical');
            grade2CellMask(grade2CellIndices) = 1;
            grade2CellMask = imdilate(grade2CellMask,strel('disk',4));
            ch1(grade2CellMask==1) = 0;
            ch2(grade2CellMask==1) = 0;
            ch3(grade2CellMask==1) = 255;

            grade3CellIndices = sub2ind(size(backgroundImage,[1 2]), ...
                cellAnnotations.("Y Position in pixels")(cellAnnotations.Grade == 3), ...
                cellAnnotations.("X Position in pixels")(cellAnnotations.Grade == 3));
            grade3CellMask = zeros(size(backgroundImage,[1 2]),'logical');
            grade3CellMask(grade3CellIndices) = 1;
            grade3CellMask = imdilate(grade3CellMask,strel('disk',4));
            ch1(grade3CellMask==1) = 255;
            ch2(grade3CellMask==1) = 255;
            ch3(grade3CellMask==1) = 0;

            grade4CellIndices = sub2ind(size(backgroundImage,[1 2]), ...
                cellAnnotations.("Y Position in pixels")(cellAnnotations.Grade == 4), ...
                cellAnnotations.("X Position in pixels")(cellAnnotations.Grade == 4));
            grade4CellMask = zeros(size(backgroundImage,[1 2]),'logical');
            grade4CellMask(grade4CellIndices) = 1;
            grade4CellMask = imdilate(grade4CellMask,strel('disk',4));
            ch1(grade4CellMask==1) = 255;
            ch2(grade4CellMask==1) = 0;
            ch3(grade4CellMask==1) = 0;

            normAirwayCellIndices = sub2ind(size(backgroundImage,[1 2]), ...
                cellAnnotations.("Y Position in pixels")(cellAnnotations.Grade == 5), ...
                cellAnnotations.("X Position in pixels")(cellAnnotations.Grade == 5));
            normAirwayCellMask = zeros(size(backgroundImage,[1 2]),'logical');
            normAirwayCellMask(normAirwayCellIndices) = 1;
            normAirwayCellMask = imdilate(normAirwayCellMask,strel('disk',4));
            ch1(normAirwayCellMask==1) = 255;
            ch2(normAirwayCellMask==1) = 0;
            ch3(normAirwayCellMask==1) = 255;

            normAlveoliCellIndices = sub2ind(size(backgroundImage,[1 2]), ...
                cellAnnotations.("Y Position in pixels")(cellAnnotations.Grade == 6), ...
                cellAnnotations.("X Position in pixels")(cellAnnotations.Grade == 6));
            normAlveoliCellMask = zeros(size(backgroundImage,[1 2]),'logical');
            normAlveoliCellMask(normAlveoliCellIndices) = 1;
            normAlveoliCellMask = imdilate(normAlveoliCellMask,strel('disk',4));
            ch1(normAlveoliCellMask==1) = 0;
            ch2(normAlveoliCellMask==1) = 255;
            ch3(normAlveoliCellMask==1) = 255;

            backgroundImage = cat(3, ch1, ch2, ch3);
        end % end function: addcelloverlaytoimage
        
function addafterlastemptycell(app,file_name,file_path,name_column_index,path_column_index)
            % add file name and paths after the last empty column in
            % UITable. Works for single or multiselect.

            if matches(class(file_name), 'char') %one file selected
                if size(app.UITable.Data,1) == 0 %table is empty
                    next_uitable_row = 1;
                else %add after the last full cell
                    last_full_cell = find(not(cellfun(@isempty,app.UITable.Data(:,name_column_index))),1,'last');

                    if isempty(last_full_cell) %no filled cells in column
                        next_uitable_row = 1; %add to first row
                    else
                        next_uitable_row = last_full_cell+1;
                    end % if isempty(last_full_cell)

                end % if size(app.UITable.Data,1) == 0

                app.UITable.Data{next_uitable_row,name_column_index} = file_name;
                app.UITable.Data{next_uitable_row,path_column_index} = file_path;

            elseif matches(class(file_name), 'cell') %multiselect
                if size(app.UITable.Data,1) == 0  %table is empty
                    next_uitable_row = 1;
                else %add after the last full cell
                    last_full_cell = find(not(cellfun(@isempty,app.UITable.Data(:,name_column_index))),1,'last');

                    if isempty(last_full_cell) %all cells in column are empty
                        next_uitable_row = 1; % add to first row
                    else
                        next_uitable_row = last_full_cell+1; %add after last full cell
                    end % if isempty(last_full_cell)

                end % if size(app.UITable.Data,1) == 0

                %get indices for the rows to be added to the table
                target_rows = next_uitable_row:next_uitable_row+length(file_name);

                for selected_image = 1:length(file_name)
                    app.UITable.Data{target_rows(selected_image),name_column_index} = file_name{selected_image};
                    app.UITable.Data{target_rows(selected_image),path_column_index} = file_path;
                end % for selected_image = 1:length(file_name)

            else
                error("Selection was not a char or cell data type.")
            end % if matches(class(file_name), 'char')
            
        end % function addafterlastemptycell

        function validateUITable(app)
            % check paths in UITable to make sure they can be found

            % define styles used to flag cells
            nonexistent_file_style = uistyle("Icon","warning");
            empty_style = uistyle("Icon","warning");
            validated_style = uistyle("Icon","none");

            % assume all files are valid until checking
            app.ALL_FILES_VALIDATED = true;

            % tidy up the table by removing empty rows
            pruneemptyrows(app)

            % validate file paths
            for table_row = 1:size(app.UITable.Data,1)
                for table_column = 1:3
                    
                    if not(isempty(app.UITable.Data{table_row,table_column}))
                        % make sure files exist at the paths
                        if not(isfile(fullfile(app.UITable.Data{table_row,table_column+3},app.UITable.Data{table_row,table_column})))
                            % mark file as invalid
                            addStyle(app.UITable,nonexistent_file_style,"cell",[table_row,table_column])
                            app.ALL_FILES_VALIDATED = false;
                        else
                            % mark file as valid (remove invalid icon)
                            % unless added by variable validator to first
                            % cell
                            if not(table_column == 1)
                                addStyle(app.UITable,validated_style,"cell",[table_row,table_column])
                            elseif table_column == 1 && not(app.STAIN_VARIABLES_VALIDATED)
                                addStyle(app.UITable,validated_style,"cell",[table_row,table_column])
                            end
                        end
                    else %empty cells are also invalid
                        addStyle(app.UITable,empty_style,"cell",[table_row,table_column])
                        app.ALL_FILES_VALIDATED = false;
                    end % if not(isempty(app.UITable.Data{table_row,table_column}))
                end % table_column = 1:3
            end % for table_row = 1:size(app.UITable.Data,1)



            % refresh GUI
            drawnow

            readytoruncheck(app)


        end %function validateUITable

        function pruneemptyrows(app)
            % find empty rows in UITable and remove them.

            % intialize vector of rows to 1
            %- presume row is empty
            empty_rows = true(size(app.UITable.Data,1),1);
            
            % iterate over table rows
            for table_row = 1:size(app.UITable.Data,1)
                % check if any columns are not empty
                for table_col = 1:size(app.UITable.Data,2)

                    if not(isempty(app.UITable.Data{table_row,table_col}))
                        % mark row as not empty
                        empty_rows(table_row) = false;
                    end % if not(isempty(app.UITable.Data{table_row,table_col}))

                end % for table_col = 1:size(app.UITable.Data,2)
            end % for table_row = 1:size(app.UITable.Data,1)

            drawnow
            % delete empty rows
            app.UITable.Data(empty_rows,:) = [];

        end %function pruneemptyrows

        function cellAnnotations = makecellannotationtable(app)
            % define table column names and data types
            tableColumnNames = {'H&E Slide ID','Stain Slide ID','Stain Class','X Position','Y Position'};
            tableColumnTypes = {'string', 'string','string','double','double'};

            % get target columns defined by user
            definedCellAnnotationVariables = {app.HEImageNameDropDown.Value, app.StainImageNameDropDown.Value, app.StainClassDropDown.Value, app.XPositionDropDown.Value, app.YPositionDropDown.Value};

            % add stain intensity column to table if defined
            if ~isempty(app.StainIntensityDropDown.Value)
                tableColumnNames(end+1) = {'Stain Intensity'};
                tableColumnTypes(end+1) = {'double'};
                definedCellAnnotationVariables(end+1) = {app.StainIntensityDropDown.Value};
            end

            cellAnnotations = readtable(app.CELL_ANNOTATION_FULLFILE_PATH,app.CELL_IMPORT_OPTS);

            % remove columns from table not used for variable definition
            trimVars = ~ismember(string(cellAnnotations.Properties.VariableNames),definedCellAnnotationVariables);
            cellAnnotations = removevars(cellAnnotations,trimVars);

            % extract H&E and stain image names and add to new columns,
            % remove old columns after
            cellAnnotations.HEImageID = extract(string(cellAnnotations.(app.HEImageNameDropDown.Value)),regexpPattern(app.HEImageNameRegexEditField.Value));
            cellAnnotations.StainImageID = extract(string(cellAnnotations.(app.StainImageNameDropDown.Value)),regexpPattern(app.StainImageNameRegexEditField.Value));
            cellAnnotations = removevars(cellAnnotations,{app.HEImageNameDropDown.Value app.StainImageNameDropDown.Value});

            % replace defined variable names for H&E and stain image with
            % new columns
            definedCellAnnotationVariables = [{'HEImageID','StainImageID'} definedCellAnnotationVariables(3:end)];
            % rename columns to match cellAnnotations table
            cellAnnotations = renamevars(cellAnnotations,definedCellAnnotationVariables,tableColumnNames);
            cellAnnotations = movevars(cellAnnotations,tableColumnNames);

        end % function: makecellannotationtable

        
        function arrangestainclassnames(app)
            % remove duplicate stain class names
                    app.StainClassNamesTextArea.Value = unique(app.StainClassNamesTextArea.Value);
                    %find negative, low, medium, and high class name
                    %positions to sort for H-score
                    zeroStainClassIndex = find(contains(app.StainClassNamesTextArea.Value, ["Negative","Neg.","Unstained","0"]));
                    lowStainClassIndex = find(contains(app.StainClassNamesTextArea.Value, ["Low","Light","Weak","1+"]));
                    mediumStainClassIndex = find(contains(app.StainClassNamesTextArea.Value, ["Medium","Med.","Mid.","2+"]));
                    highStainClassIndex = find(contains(app.StainClassNamesTextArea.Value, ["High","Strong","3+"]));
                    
                    %get the found name classes first, remove from list, then append the rest
                    stainClassNames = app.StainClassNamesTextArea.Value([zeroStainClassIndex lowStainClassIndex mediumStainClassIndex highStainClassIndex]);
                    % add blank dummy row to StainClassNamesTextArea to
                    % prevent 0 index error.
                    % remove rows using empty char vectorto show placeholder.
                    app.StainClassNamesTextArea.Value{end+1} = '';
                    app.StainClassNamesTextArea.Value([zeroStainClassIndex lowStainClassIndex mediumStainClassIndex highStainClassIndex]) = '';
                    stainClassNames = [stainClassNames; app.StainClassNamesTextArea.Value];
                    app.StainClassNamesTextArea.Value = stainClassNames;
                    %remove any blank lines
                    app.StainClassNamesTextArea.Value = app.StainClassNamesTextArea.Value(find(~cellfun(@isempty,app.StainClassNamesTextArea.Value)));
                    statusupdate(app,"Attempted to sort pre-defined stain class to Negative<Low<Medium<High")
        end % function: arrangestainclassnames
        
        function results = retrieveUITableData(app,qRows,qCols,ReturnAsTable)
            arguments
                app 
                qRows = ":" %retrieve all rows by default
                qCols = ":" %retreive all columns by default
                ReturnAsTable = false %return as matlab table instead of cell array
            end
            % retrieve data from UITable like a regular matlab table
            % particularly, allow the use of column names for queries

            % convert UITable to matlab table
            dummyTable = app.UITable.Data;

            % cell2table complains if you give it too many variable names
            % keep only the columns that have been defined in the table
            nCols = size(dummyTable,2);
            dummyTable = cell2table(dummyTable,"VariableNames",app.UITable.ColumnName(1:nCols));

            if ReturnAsTable
                results = dummyTable(qRows,qCols);
            else %return requested data to user as cell array
                results = table2array(dummyTable(qRows,qCols));
            end
           
        end % function retrieveUITableData
           
    end % methods: Functions


    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
              % locate where the application is launched from
            %- use mfilename("fullpath") to get location of launched file
            %- strip off mfilename at the end of the char vector to get
            %- folder that should contain the mlapp file and the
            %- 'Resources' directory.
            %-- This approach should work regardless of platform and
            %-- deployment
            mlapp_location = replace(mfilename('fullpath'),[filesep mfilename()]+textBoundary('end'),'');

            % set path to expected 'Resources' folder location
            app.RESOURCE_DIR_PATH = fullfile(mlapp_location,"Resources");
            

            %validate location by adding image
            app.AppIcon.ImageSource = fullfile(app.RESOURCE_DIR_PATH,"UI Files","Stained GLASS icon.png");
            %get starting directory to recall during development
            if not(isdeployed)
                % change directory to where .mlapp or .m file is located
                cd(mlapp_location)
                app.START_DIR = mlapp_location;
                %reveal copy to base button for debugging
                app.CopytobaseButton.Visible = 'on';
                app.CopytobaseButton.Enable = 'on';
                % show path to common folders
                %uialert(app.UIFigure,sprintf("ctfroot: %s\npwd: %s\nmfilename: %s\n",ctfroot,pwd,mlapp_location),"Current File Paths","Icon","info")
            end % if not(isdeployed)


            app.VersionLabel.Text = sprintf("version %s",app.STAINED_GLASS_AI_VERSION);


            % change directory to user folder to make finding input/output
            % directories easier
            if ismac
                cd('~');
                % change directory to desktop
                try
                    cd('Desktop');
                catch
                    % remain in user folder if no Desktop folder
                end
            elseif ispc
                user = getenv('USERPROFILE');
                cd(fullfile(user));
                % change directory to desktop
                try
                    cd('Desktop');
                catch
                    % remain in user folder if no Desktop folder
                end
            end % if ismac

            app.LAST_SELECTED_DIR = pwd;

            %check for app updates
            versioncheck(app)

            %initilialize file lists to empty cell arrays
            app.SELECTED_GLASSAI_ANNOTATION_FILE_NAME = cell(0);
            app.SELECTED_CELL_ANNOTATION_FILE_NAME_LIST = cell(0);

            %move panels to uifigure position and toggle off except File Loading
            app.FileLoadingPanel.Position = [185,1,715,508];

            app.PeritumorPanel.Visible = "off";
            app.PeritumorPanel.Position = [185,1,405,508];
            
            app.StainThresholdPanel.Visible = "off";
            app.StainThresholdPanel.Position = [185,1,405,508];
                      
            app.CellAnnotationPanel.Visible = "off";
            app.CellAnnotationPanel.Position = [185,1,405,508];
            
            
            % set up peritumor analysis demo
            app.DEMO_IMAGE = imread(fullfile(app.RESOURCE_DIR_PATH, "UI Files","demo_image.tif"));
            app.DEMO_MASK = load(fullfile(app.RESOURCE_DIR_PATH, "UI Files","demo_mask.mat")).demo_mask;
            app.DEMO_SHORE_MASK = generateperitumorshoremask(app, app.DEMO_MASK);
            updateperitumordemo(app);

            statusupdate(app,"Startup operations complete")
        end

        % Button pushed function: RunButton
        function RunButtonPushed(app, event)
            statusupdate(app,"Run button pushed")
            %disable run button
            app.RunButton.Text = "Running";
            app.RunButton.Enable = "off";
            pause(0.01)

            %disable panels to prevent changes during run
            app.FileLoadingPanel.Enable = "off";
            app.CellAnnotationPanel.Enable = "off";
            app.StainThresholdPanel.Enable = "off";
            app.PeritumorPanel.Enable = "off";
            pause(0.01)

            %set summary output to first cell annotation directory if not set
            if isempty(app.OUTPUT_FOLDER_PATH)
                app.OUTPUT_FOLDER_PATH = app.UITable.Data{1,4};
                statusupdate(app,"Set output path to match first cell annotation directory")
            end
            
            %set the stain name
            if isempty(app.StainNameEditField.Value)
                app.STAIN_NAME = "STAIN";
            else
                app.STAIN_NAME = app.StainNameEditField.Value;
            end

            app.HSCORE_VALUES = str2double(app.HScoreTextArea.Value)'; %transposed to horizontal vector
            %remove any blank lines from the H-score assignement
            app.StainClassNamesTextArea.Value = app.StainClassNamesTextArea.Value(find(~cellfun(@isempty,app.StainClassNamesTextArea.Value)));

            %switch over to file loading panel to show progress
            app.FileLoadingPanel.Visible = "off";
            app.CellAnnotationPanel.Visible = "off";
            app.PeritumorPanel.Visible = "off";
            app.StainThresholdPanel.Visible = "off";
            app.FileLoadingPanel.Visible = "on";

            statusupdate(app,"Switched to File Loading Panel")

            try
            main(app)
            catch
            end

            % enable run button again after finishing analysis
            app.RunButton.Text = "Run";
            app.RunButton.Enable = "on";

            %re-enable panels
            app.FileLoadingPanel.Enable = "on";
            app.CellAnnotationPanel.Enable = "on";
            app.StainThresholdPanel.Enable = "on";
            app.PeritumorPanel.Enable = "on";

            pause(0.01)
        end

        % Button pushed function: SelectOutputFolder
        function SelectOutputFolderButtonPushed(app, event)
            statusupdate(app,"Select output folder button pushed")
            app.OUTPUT_FOLDER_PATH = uigetdir(app.LAST_SELECTED_DIR,'Select output destination');
            % store selected path and update label with file name
            if ~isequal(app.OUTPUT_FOLDER_PATH, 0)
                statusupdate(app,"Output folder path set")
                app.OutputFolderLabel.Value = app.OUTPUT_FOLDER_PATH;
                app.LAST_SELECTED_DIR = app.OUTPUT_FOLDER_PATH;
            else
                statusupdate(app,"No output folder was selected")
                return
            end
        end

        % Value changed function: HEImageNameDropDown
        function HEImageNameDropDownValueChanged(app, event)
            %validate that values in selected column are the expected type
            variableName = 'H&E Image Name';
            acceptableClasses = {'string','char'};
            acceptableClassesSummary = 'text';
            selectedColumnName = app.HEImageNameDropDown.Value;
            
            % do nothing if empty value is selected
            if isempty(selectedColumnName)
                return
            end

            tableValue = app.PREVIEW_CELLTABLE{1,selectedColumnName};
            %extract value from cell if stored that way in table
            if matches(class(tableValue),'cell')
                tableValue = tableValue{1};
            end

            %attempt to convert to text if that is what is expected
            if matches(acceptableClassesSummary,'text')
                tableValue = num2str(tableValue);
            end
            
            valueClass = class(tableValue);
           
            if sum(matches(acceptableClasses,valueClass)) == 1
                %do stuff if class is an expected type
                runheimagenameregex(app);
            else 
                %alert user that class is not expected type and reset
                %dropdown
                wrongDataTypeAlertTitle = sprintf("Incorrect data type (%s)",variableName);
                wrongDataTypeAlertMessage = sprintf("The selected column did not contain data of the expected type: %s.\nInstead it contained data of the type: %s\nPlease select a different column",acceptableClassesSummary,valueClass);
                uialert(app.UIFigure,wrongDataTypeAlertMessage,wrongDataTypeAlertTitle,"Icon","error")
                app.HEImageNameDropDown.Value =  '';
            end

            resetvalidationchecks(app);
        end

        % Value changed function: HEImageNameRegexEditField
        function HEImageNameRegexEditFieldValueChanged(app, event)
            runheimagenameregex(app);
            resetvalidationchecks(app);
        end

        % Value changed function: VariablePreviewDropDown
        function PreviewFileChanged(app, event)
            %use the same file for variable definition and stain
            %thresholding
            value = app.VariablePreviewDropDown.Value;
            app.StainECDFPreviewFileDropDown.Value = value;

            statusupdate(app,append("File used for preview was changed to ", value))
            % let the user know this could take some time
            progressBar = uiprogressdlg(app.UIFigure,'Title',"Loading data from file...",'Indeterminate','on');
            drawnow
            try
                selectedFileRow = find(matches(app.UITable.Data(:,1),value));
                selectedFileName = app.UITable.Data{selectedFileRow,1};
                selectedFilePath = app.UITable.Data{selectedFileRow,4};

                app.CELL_IMPORT_OPTS = detectImportOptions(fullfile(selectedFilePath,selectedFileName),VariableNamingRule="preserve");
                %remove ' ' as a delimiter if it is somehow detected
                app.CELL_IMPORT_OPTS.Delimiter = app.CELL_IMPORT_OPTS.Delimiter(not(ismember(app.CELL_IMPORT_OPTS.Delimiter,{' '})));
                %redo import option detection without the ' ' delimiter
                app.CELL_IMPORT_OPTS = detectImportOptions(fullfile(selectedFilePath,selectedFileName),VariableNamingRule="preserve", Delimiter = app.CELL_IMPORT_OPTS.Delimiter);

                %read in table

                app.PREVIEW_CELLTABLE = readtable(fullfile(selectedFilePath,selectedFileName),app.CELL_IMPORT_OPTS);

                % get stain intensities for ecdf plot
                try
                    app.ECDF_INTENSITIES = table2array(app.PREVIEW_CELLTABLE(:,app.StainIntensityDropDown.Value));
                catch ME
                    if isequal(ME.identifier, 'MATLAB:table:UnrecognizedVarName') && contains(ME.message,app.StainIntensityDropDown.Value)
                        uialert(app.UIFigure,{'Column defined for Stain Intensity could not be found in the selected file.','Reassign the column and try again.'},"Missing Column in Data","Icon","error")
                    end
                    rethrow(ME)
                end

                %update dropdowns in cell annotation panel with new variable names
                updatecellannotationvariablenames(app,string(app.CELL_IMPORT_OPTS.VariableNames));

            catch
                close(progressBar)
            end
            close(progressBar)
        end

        % Value changed function: StainThresholdsEditField
        function StainThresholdsEditFieldValueChanged(app, event)
            value = app.StainThresholdsEditField.Value;
            % remove any non-numeric, ',', or '.' characters
            value(regexp(value,'[^0-9,.]')) = [];
            app.StainThresholdsEditField.Value = value;
            statusupdate(app,append("Custom stain intensity threholds changed to ", value))
            updatestainecdfplot(app);
        end

        % Button pushed function: RefreshStainECDFPlotButton
        function RefreshStainECDFPlotButtonPushed(app, event)
            updatestainecdfplot(app);
        end

        % Button pushed function: 
        % ValidateCellAnnotationFilesVariablesButton
        function ValidateCellAnnotationFilesVariablesButtonPushed(app, event)
            statusupdate(app,"Validate variables in files button pushed")
            tableColumnNames = {'H&E Slide ID','Stain Slide ID','Stain Class','Stain Intensity', 'Stain Thresholds','X Position','Y Position','Position Unit'};
            tableColumnTypes = {'string', 'string','string','string','string','string','string','string'};
            app.STAIN_VARIABLES_VALIDATION_TABLE = table('Size',[length(app.UITable.Data(:,1)) length(tableColumnTypes)], ...
                'VariableNames',tableColumnNames,'VariableTypes',tableColumnTypes, ...
                'RowNames',app.UITable.Data(:,1));

     
            missingVariableCellAnnotationFileCount = 0;

            %switch over to file loading panel to show progress
            app.FileLoadingPanel.Visible = "off";
            app.CellAnnotationPanel.Visible = "off";
            app.PeritumorPanel.Visible = "off";
            app.StainThresholdPanel.Visible = "off";
            app.FileLoadingPanel.Visible = "on";
            statusupdate(app,"Switched to File Loading Panel")
            
            for iFile = 1:size(app.UITable.Data,1)

                %convert file name cell to string
                currentFileName = app.UITable.Data{iFile,1};
                currentFilePath = app.UITable.Data{iFile,4};

                statusupdate(app,append("Checking variables in ",currentFileName))

                % indicate file is being validated
                testingVariableStyle = uistyle("Icon","question","IconAlignment","rightmargin");
                addStyle(app.UITable,testingVariableStyle,'cell',[iFile, 1])
                pause(0.01) %used to refresh the GUI and show icon in table

                % read in cell annotations columns from first line of file
                % using delimiter detected from preview file
                fid = fopen(fullfile(currentFilePath,currentFileName));
                inputColumnNames = split(fgetl(fid),sprintf(app.CELL_IMPORT_OPTS.Delimiter{1}));
                
                %get next line to test regexs 
                previewLine = split(fgetl(fid),sprintf(app.CELL_IMPORT_OPTS.Delimiter{1}));


                % find H&E slide column and test name extractor
                if sum(matches(inputColumnNames,app.HEImageNameDropDown.Value)) == 1
                    testString = string(previewLine{matches(inputColumnNames,app.HEImageNameDropDown.Value)});
                    if ~isempty(app.HEImageNameRegexEditField.Value)
                        regexResult = extract(testString,regexpPattern(app.HEImageNameRegexEditField.Value));
                    else
                        regexResult = testString;
                    end
                    app.STAIN_VARIABLES_VALIDATION_TABLE(currentFileName,'H&E Slide ID') = {regexResult};
                else
                    app.STAIN_VARIABLES_VALIDATION_TABLE(currentFileName,'H&E Slide ID') = {"<missing>"};
                end

                % find Stain slide column and test name extractor
                if sum(matches(inputColumnNames,app.StainImageNameDropDown.Value)) == 1
                    testString = string(previewLine{matches(inputColumnNames,app.StainImageNameDropDown.Value)});
                    if ~isempty(app.StainImageNameRegexEditField.Value)
                        regexResult = extract(testString,regexpPattern(app.StainImageNameRegexEditField.Value));
                    else
                        regexResult = testString;
                    end
                    app.STAIN_VARIABLES_VALIDATION_TABLE(currentFileName,'Stain Slide ID') = {regexResult};
                else
                    app.STAIN_VARIABLES_VALIDATION_TABLE(currentFileName,'Stain Slide ID') = {"<missing>"};
                end

                % find Stain class column
                % get list of unique values
                if sum(matches(inputColumnNames,app.StainClassDropDown.Value)) == 1
                    app.STAIN_VARIABLES_VALIDATION_TABLE(currentFileName,'Stain Class') = {app.StainClassDropDown.Value};
                else
                    app.STAIN_VARIABLES_VALIDATION_TABLE(currentFileName,'Stain Class') = {"<missing>"};
                end

                % find Stain intensity column if set
                if isempty(app.StainIntensityDropDown.Value)
                    app.STAIN_VARIABLES_VALIDATION_TABLE(currentFileName,'Stain Intensity') = {"<Not set>"};
                elseif sum(matches(inputColumnNames,app.StainIntensityDropDown.Value)) == 1
                    app.STAIN_VARIABLES_VALIDATION_TABLE(currentFileName,'Stain Intensity') = {app.StainIntensityDropDown.Value};
                else
                    app.STAIN_VARIABLES_VALIDATION_TABLE(currentFileName,'Stain Intensity') = {"<missing>"};
                end

                % find Stain thresholds
                if app.UseCustomThesholdCheckBox.Value == true
                    app.STAIN_VARIABLES_VALIDATION_TABLE(currentFileName,'Stain Thresholds') = {app.StainThresholdsEditField.Value};
                else
                    app.STAIN_VARIABLES_VALIDATION_TABLE(currentFileName,'Stain Thresholds') = {"<Predefined>"};
                end

                % find X position
                if sum(matches(inputColumnNames,app.XPositionDropDown.Value)) == 1
                    app.STAIN_VARIABLES_VALIDATION_TABLE(currentFileName,'X Position') = {app.XPositionDropDown.Value};
                else
                    app.STAIN_VARIABLES_VALIDATION_TABLE(currentFileName,'X Position') = {"<missing>"};
                end

                % find Y position
                if sum(matches(inputColumnNames,app.YPositionDropDown.Value)) == 1
                    app.STAIN_VARIABLES_VALIDATION_TABLE(currentFileName,'Y Position') = {app.YPositionDropDown.Value};
                else
                    app.STAIN_VARIABLES_VALIDATION_TABLE(currentFileName,'Y Position') = {"<missing>"};
                end

                % store Position unit
                app.STAIN_VARIABLES_VALIDATION_TABLE(currentFileName,'Position Unit') = {app.PositionUnitDropDown.Value};

                missingVariableCount = nnz(matches(string(table2cell(app.STAIN_VARIABLES_VALIDATION_TABLE(currentFileName,:))),"<missing>"));

                if missingVariableCount > 0
                    missingVariableStyle = uistyle("Icon","error","IconAlignment","rightmargin");
                    addStyle(app.UITable,missingVariableStyle,'cell',[iFile, 1])
                    missingVariableCellAnnotationFileCount = missingVariableCellAnnotationFileCount+1;
                elseif missingVariableCount == 0
                    foundVariableStyle = uistyle("Icon","success","IconAlignment","rightmargin");
                    addStyle(app.UITable,foundVariableStyle,'cell',[iFile, 1])
                end

                statusupdate(app,append("Validated variables in ", currentFileName))
            end % for: iFile = 1:size(app.UITable.Data,2)

            % alert the user if there are any files that do not pass validation
            if missingVariableCellAnnotationFileCount > 0
                statusupdate(app,"Some cell annotation files were missing variables")
                app.STAIN_VARIABLES_VALIDATED = false;
                app.ValidateCellAnnotationFilesVariablesButton.Icon = "error";
                missingVariableAlertMessage = sprintf("%d cell annotation files do not have columns that match your definitions.\nThese issues must be resolved to continue.\nCheck the Validation Table for details.",missingVariableCellAnnotationFileCount);
                uialert(app.UIFigure,missingVariableAlertMessage,"Issues with selected files/columns","Icon","error")
                % show the validation results table
                validationTableFigure = uifigure("WindowStyle","normal","Position",[257 508 1030 420],"Name","Cell Annotation Variable Validation");
                validationTableFigureGrid = uigridlayout(validationTableFigure);
                validationTableFigureTable = uitable(validationTableFigureGrid,"Data",app.STAIN_VARIABLES_VALIDATION_TABLE, ...
                    "ColumnWidth","fit");
                validationTableFigureTable.Layout.Row = [1,2];
                validationTableFigureTable.Layout.Column = [1,2];
                % highlight <missing> cells in table
                [missingRow, missingCol] = find(matches(string(table2cell(app.STAIN_VARIABLES_VALIDATION_TABLE)),"<missing>"));
                addStyle(validationTableFigureTable,missingVariableStyle,"cell",[missingRow', missingCol']);
                resetvalidationchecks(app);
            else
                statusupdate(app,"All variables in cell annotation files were validated")
                app.STAIN_VARIABLES_VALIDATED = true;
                app.CellAnnotationFileVariablesLamp.Visible = "on";
                app.ValidateCellAnnotationFilesVariablesButton.Enable = "off";
                readytoruncheck(app)
                
            end

        end

        % Value changed function: StainImageNameDropDown
        function StainImageNameDropDownValueChanged(app, event)
            %validate that values in selected column are the expected type
            variableName = 'Stain Image Name';
            acceptableClasses = {'string','char'};
            acceptableClassesSummary = 'text';
            selectedColumnName = app.StainImageNameDropDown.Value;

            % do nothing if empty value is selected
            if isempty(selectedColumnName)
                return
            end

            tableValue = app.PREVIEW_CELLTABLE{1,selectedColumnName};
            %extract value from cell if stored that way in table
            if matches(class(tableValue),'cell')
                tableValue = tableValue{1};
            end

            %attempt to convert to text if that is what is expected
            if matches(acceptableClassesSummary,'text')
                tableValue = num2str(tableValue);
            end
            
            valueClass = class(tableValue);
           
            if sum(matches(acceptableClasses,valueClass)) == 1
                %do stuff if class is an expected type
                runstainimagenameregex(app);
            else 
                %alert user that class is not expected type and reset
                %dropdown
                wrongDataTypeAlertTitle = sprintf("Incorrect data type (%s)",variableName);
                wrongDataTypeAlertMessage = sprintf("The selected column did not contain data of the expected type: %s.\nInstead it contained data of the type: %s\nPlease select a different column",acceptableClassesSummary,valueClass);
                uialert(app.UIFigure,wrongDataTypeAlertMessage,wrongDataTypeAlertTitle,"Icon","error")
                app.StainImageNameDropDown.Value =  '';
            end

            resetvalidationchecks(app);
        end

        % Value changed function: StainImageNameRegexEditField
        function StainImageNameRegexEditFieldValueChanged(app, event)
            runstainimagenameregex(app);
            resetvalidationchecks(app);
        end

        % Value changed function: StainClassNamesTextArea
        function StainClassNamesTextAreaValueChanged(app, event)
            %update stain intensity ECDF panel
            %app.StainECDFPreviewFileDropDownValueChanged
            updatestainecdfplot(app)
        end

        % Button pushed function: SwapnameregexsButton
        function SwapnameregexsButtonPushed(app, event)
            statusupdate(app,"Swap name regex button pushed")
            %store old values
            oldStainRegex = app.StainImageNameRegexEditField.Value;
            oldHERegex = app.HEImageNameRegexEditField.Value;
            %swap values
            newStainRegex = oldHERegex;
            newHERegex = oldStainRegex;
            % assign new values
            app.StainImageNameRegexEditField.Value = newStainRegex;
            app.HEImageNameRegexEditField.Value = newHERegex;
            % update panel using new values
            app.StainImageNameRegexEditFieldValueChanged
            app.HEImageNameRegexEditFieldValueChanged
        end

        % Value changed function: PeritumorShoreIntervalsEditField
        function PeritumorShoreIntervalsEditFieldValueChanged(app, event)
            % remove any characters that are not 0-9 '.' or ','
            value =  app.PeritumorShoreIntervalsEditField.Value;
            app.PeritumorShoreIntervalsEditField.Value = regexprep(value,'[^0-9.,','');
            statusupdate(app,append("Peritumor shore intervals changed to ",value))
            app.DEMO_SHORE_MASK = generateperitumorshoremask(app,app.DEMO_MASK);
            statusupdate(app,"Generated new demo peritumor shore mask")
            updateperitumordemo(app);
            
        end

        % Value changed function: PeritumorcolormapDropDown
        function PeritumorcolormapDropDownValueChanged(app, event)
            updateperitumordemo(app);
            
        end

        % Value changed function: PeritumorTranparencySlider
        function PeritumorTranparencySliderValueChanged(app, event)
            updateperitumordemo(app);
            
        end

        % Value changed function: InvertCheckBox
        function InvertCheckBoxValueChanged(app, event)
            updateperitumordemo(app);
            
        end

        % Selection changed function: WorkflowButtonGroup
        function WorkflowButtonGroupSelectionChanged(app, event)
            selectedButton = app.WorkflowButtonGroup.SelectedObject;
            % turn off all panels then turn on target panel
              app.FileLoadingPanel.Visible = "off";
              app.CellAnnotationPanel.Visible = "off";
              app.PeritumorPanel.Visible = "off";
              app.StainThresholdPanel.Visible = "off";
            switch selectedButton.Text
                case 'File Loading'
                    app.FileLoadingPanel.Visible = "on";
                    statusupdate(app,"Switched to File Loading Panel")
                case 'Column Assignment'
                    app.CellAnnotationPanel.Visible = "on";
                    statusupdate(app,"Switched to Variable Column Assignment Panel")
                case 'Peritumor Analysis Settings'
                    app.PeritumorPanel.Visible = "on";
                    statusupdate(app,"Switched to Peritumor Analysis Settings Panel")
                case 'Customize Stain Thresholds'
                    app.StainThresholdPanel.Visible = "on";
                    statusupdate(app,"Switched to Customize Stain Thresholds Panel")
            end

        end

        % Value changed function: HScoreTextArea
        function HScoreTextAreaValueChanged(app, event)
            % move to temp variable to use in anonymous function
            value = app.HScoreTextArea.Value;
            % remove non-numeric characters (anything not 0-9 or '.')
            value = cellfun(@(val)regexprep(val,'[^0-9.]',''),value,'UniformOutput',false);
            % remove decimal values (any '.' and any following numbers)
            value = cellfun(@(val)regexprep(val,'(\.[0-9]*)',''),value,'UniformOutput',false);
            % replace values > 3 with 3
            value = cellfun(@(val)regexprep(val,'[^0-3.]','3'),value,'UniformOutput',false);
            % remove empty rows
            value = value(find(~cellfun(@isempty,value)));
            app.HScoreTextArea.Value = value;
                    
        end

        % Button pushed function: SelectcellannotationsButton
        function SelectcellannotationsButtonPushed(app, event)
            % prompt user to select cell annotation files
            [new_file_name, new_file_path] = uigetfile({'*.csv; *.tsv; *.txt'},'Select cell annotation file(s)',app.LAST_SELECTED_DIR,MultiSelect='on');

            if isequal(new_file_name, 0) % user canceled selection
                return
            else %add files to UITable
                addafterlastemptycell(app,new_file_name,new_file_path,1,4)

                % remember this directory for next dialog
                app.LAST_SELECTED_DIR = new_file_path;

                % validate UITable
                validateUITable(app)

                %update files available for checking variables
                %select the first file if one is not already selected
                if isempty(app.VariablePreviewDropDown.Value)
                    app.UITableCellEdit
                    app.VariablePreviewDropDown.Value = app.VariablePreviewDropDown.Items(1);
                    app.PreviewFileChanged
                else
                    app.UITableCellEdit
                end
                
            end % if isequal(new_file_name, 0)   
        end

        % Button pushed function: SelectGLASSAIclassificationsButton
        function SelectGLASSAIclassificationsButtonPushed(app, event)
            % prompt user to select GLASS-AI classification files
            [new_file_name, new_file_path] = uigetfile({'*classes.mat'},'Select GLASS-AI classification file(s)',app.LAST_SELECTED_DIR,MultiSelect='on');

            if isequal(new_file_name, 0) % user canceled selection
                return
            else %add files to UITable
                addafterlastemptycell(app,new_file_name,new_file_path,2,5)

                % remember this directory for next dialog
                app.LAST_SELECTED_DIR = new_file_path;

                % validate UITable
                validateUITable(app)
            end % if isequal(new_file_name, 0)   
        end

        % Button pushed function: SelecttumorlabelmasksButton
        function SelecttumorlabelmasksButtonPushed(app, event)
            % prompt user to select tumor label files
            [new_file_name, new_file_path] = uigetfile({'*_tumor_labels.mat'},'Select tumor label mask(s)',app.LAST_SELECTED_DIR,MultiSelect='on');

            if isequal(new_file_name, 0) % user canceled selection
                return
            else %add files to UITable
                addafterlastemptycell(app,new_file_name,new_file_path,3,6)

                % remember this directory for next dialog
                app.LAST_SELECTED_DIR = new_file_path;

                % validate UITable
                validateUITable(app)
            end % if isequal(new_file_name, 0)   
        end

        % Cell edit callback: UITable
        function UITableCellEdit(app, event)
            % update files available for variable and stain intensity
            % distribution previews
            app.VariablePreviewDropDown.Items = app.UITable.Data(:,1);
            app.StainECDFPreviewFileDropDown.Items = app.UITable.Data(:,1);
        end

        % Double-clicked callback: UITable
        function UITableDoubleClicked(app, event)
% on double click, prompt user to select file to fill cell

            %get index of double-clicked cell
            %- clicking outside of cells in table returns []
            displayRow = event.InteractionInformation.DisplayRow;
            displayColumn = event.InteractionInformation.DisplayColumn;
            
            if isequal(displayColumn,[]) %do nothing if clicked outside of cells
                return
            else
                %change file selection based on selected column
                %- only allow users to select 1 file to place in cell
                switch displayColumn 
                    case 1 %image files
                        [new_file_name, new_file_path] = uigetfile({'*.svs;*.tif;*.tiff;*.jpg;*.jpeg;*.png','Image Files (*.svs,*.tif,*.tiff,*.jpg,*.jpeg,*.png)'},'Select input image',app.LAST_SELECTED_DIR,MultiSelect='off');
                        if isequal(new_file_name, 0) %user canced selection
                            %do nothing
                        else
                            % add file name to cell and path to
                            % coresponding cell
                            app.UITable.Data{displayRow,1} = new_file_name;
                            app.UITable.Data{displayRow,4} = new_file_path;
                            % remember directory
                            app.LAST_SELECTED_DIR = new_file_path;
                        end % if isequal(new_file_name, 0)
                    case 2 % GLASS-AI classification files
                        [new_file_name, new_file_path] = uigetfile({'*classes.mat'},'Select GLASS-AI classification file',app.LAST_SELECTED_DIR);
                        if isequal(new_file_name, 0) %user canced selection
                            %do nothing
                        else
                            % add file name to cell and path to
                            % coresponding cell
                            app.UITable.Data{displayRow,2} = new_file_name;
                            app.UITable.Data{displayRow,5} = new_file_path;
                            % remember directory
                            app.LAST_SELECTED_DIR = new_file_path;
                        end % if isequal(new_file_name, 0)
                    case 3 % manual annotation files
                        [new_file_name, new_file_path] = uigetfile({'*.geojson'},'Select manual annotation file',app.LAST_SELECTED_DIR);
                        if isequal(new_file_name, 0) %user canced selection
                            %do nothing
                        else
                            % add file name to cell and path to
                            % coresponding cell
                            app.UITable.Data{displayRow,3} = new_file_name;
                            app.UITable.Data{displayRow,6} = new_file_path;
                            % remember directory
                            app.LAST_SELECTED_DIR = new_file_path;
                        end % if isequal(new_file_name, 0)
                end % switch displayColumn 
                % validate input files
                validateUITable(app)
            end % if isequal(displayColumn,[])
            
        end

        % Selection changed function: UITable
        function UITableSelectionChanged(app, event)
            selection = app.UITable.Selection;
            
            %enable single column context menu items if only one column
            %is selected
            if not(isempty(selection)) & size(unique(selection(:,2))) == 1
                app.ChangeFolderMenu.Enable = 'on';
                app.PopulatefromFolderMenu.Enable = 'on';
            else
                app.ChangeFolderMenu.Enable = 'off';
                app.PopulatefromFolderMenu.Enable = 'off';
            end % if not(isempty(selection)) & size(unique(selection(:,2))) == 1

            
        end

        % Menu selected function: UnselectMenu
        function UnselectMenuSelected(app, event)
                        %unselect cells in UITable

            % setting app.UITable.Selection = [] leaves a border around
            % last selected cell. This method works better.
            app.UITable.SelectionType = 'row';
            pause(0.1);
            app.UITable.SelectionType = 'cell';
        end

        % Menu selected function: ClearSelection
        function ClearSelectionMenuSelected(app, event)
                        % clear the contents of currently selected cell(s) and the
            % corresponding cell(s) in the corresponding path columns


            if isempty(app.UITable.Selection)
                return
            end

            indices = app.UITable.Selection;


            for selected_cell = 1:size(indices,1)
                selected_row = indices(selected_cell,1);
                selected_col = indices(selected_cell,2);

                app.UITable.Data{selected_row, selected_col} = []; %clear cell
                app.UITable.Data{selected_row, selected_col+3} = [];%clear path column too

            end % for selected_cell = 1:size(indices,1)
            
            % validate input files
            validateUITable(app)
        end

        % Menu selected function: ClearRows
        function ClearRowsMenuSelected(app, event)
            % clear contents of currently selected row(s). This actually
            % deletes the entire row from the UITable.

            if isempty(app.UITable.Selection)
                return
            end


            indices = app.UITable.Selection;

            
            % remove any 'duplicate' rows caused by the selection spanning
            % multiple columns in the same row
            %- This also sorts the row indices into ascending order
            selected_rows = unique(indices(:,1));
            % flip to delete from bottom up
            selected_rows = flip(selected_rows);

            for selected_row = selected_rows
                app.UITable.Data(selected_row,:) = []; %clear row
            end % for selected_row = 1:size(selected_rows)

            % validate input files
            validateUITable(app) 
        end

        % Menu selected function: ClearColumns
        function ClearColumnsMenuSelected(app, event)
            % clear contents of the currently selected column(s).


            if isempty(app.UITable.Selection)
                return
            end

            % remove any 'duplicate' columns caused by the selection spanning
            % multiple rows in the same column
            selected_columns = unique(app.UITable.Selection(:,2));

            %remove icons from cleared cells
            cleared_style = uistyle("Icon","none");

            % must individually clear the contents of each cell in column
            % or the entire column gets deleted from the table
            for selected_col = selected_columns
                for table_row = 1:size(app.UITable.Data,1)
                    app.UITable.Data{table_row,selected_col} = []; %clear cell
                    app.UITable.Data{table_row,selected_col+3} = []; %clear path column too

                    %remove icons from cleared cells
                    addStyle(app.UITable,cleared_style,"cell",[table_row selected_col])

                end % for table_row = 1:size(app.UITable.Data,1)
            end % for selected_col = 1:size(selected_columns,1)

            % validate input files
            validateUITable(app)
        end

        % Menu selected function: ClearInvalidFiles
        function ClearInvalidFilesMenuSelected(app, event)
            % clear all of the cells in the UITable that do not have valid
           % file paths.

           if isempty(app.UITable.Data)
                return
           end

           table_rows = size(app.UITable.Data,1);
           table_cols = 3; %only need to look at first 3 columns
            
           %remove icons from cleared cells
           cleared_style = uistyle("Icon","none");

           for table_row = 1:table_rows
               for table_col = 1:table_cols
                   try
                       if not(isfile(app.UITable.Data{table_row,table_col+3}))
                            app.UITable.Data{table_row,table_col} = []; %clear cell
                            app.UITable.Data{table_row,table_col+3} = []; %clear path cell too
                            
                            %remove icon used to mark invalid cells
                            addStyle(app.UITable,cleared_style,"cell",[table_row table_col])
                       end % if not(isfile(app.UITable.Data{table_row,table_col+3}))
                   catch
                       continue
                   end % try
               end % for table_col = 1:table_cols
           end % for table_row = 1:table_rows

           % validate input files
           validateUITable(app)
        end

        % Menu selected function: ChangeFolderMenu
        function ChangeFolderMenuSelected(app, event)
            % replace the path in the corresponding column of the selected
            % cell(s)

            selected_column = unique(app.UITable.Selection(:,2));
            selected_rows = app.UITable.Selection(:,1);

            %prompt user to select containing directory
            column_file_type = ['image files', 'GLASS-AI classifications','manual annotations'];
            prompt_message = ['Select directory containing ' column_file_type(selected_column)];
            new_directory = uigetdir(app.LAST_SELECTED_DIR, prompt_message);

            if isequal(new_directory, 0) % user canceled selection
                return
            end

            % remember this directory for next dialog
            app.LAST_SELECTED_DIR = new_file_path;

            % change directory for selected cells
            for table_row = 1:size(selected_rows,1)
                % skip empty cells
                if isempty(app.UITable.Data{selected_rows(table_row),selected_column})
                    continue
                else
                    app.UITable.Data{selected_rows(table_row),selected_column+3} = new_directory;
                end % if isempty(app.UITable.Data{selected_rows(table_row),selected_column})
            end % for table_row = 1:size(selected_rows,1)

            % validate input files
            validateUITable(app)
        end

        % Menu selected function: PopulatefromFolderMenu
        function PopulatefromFolderMenuSelected(app, event)
            % look in selected directory for files that match the exisiting
            % files in the selected row(s).
            
            selected_column = unique(app.UITable.Selection(:,2));
            selected_rows = app.UITable.Selection(:,1);

            % do nothing if no cells are selected
            if isempty(app.UITable.Selection)
                return
            end

            %prompt user to select containing directory
            column_file_type = ['Cell annotations', 'GLASS-AI classifications','Tumor label masks'];
            prompt_message = ['Select directory containing ' column_file_type(selected_column)];
            new_directory = uigetdir(app.LAST_SELECTED_DIR, prompt_message);

            if isequal(new_directory, 0) % user canceled selection
                return
            end

            % remember this directory for next dialog
            app.LAST_SELECTED_DIR = new_file_path;

            for table_row = 1:size(selected_rows,1)
                % get names by stripping file extensions
                %- name precedence: cell annotation, classification, tumor
                %- label mask

                %- input image
                %-- use regex definitions to pull H&E image name
                if not(isempty(app.UITable.Data{selected_rows(table_row),1}))
                    [~,image_name,~] = fileparts(app.UITable.Data{selected_rows(table_row),1});
                    image_name =  extract(image_name,regexpPattern(app.HEImageNameRegexEditField.Value));
                else
                    image_name = '';
                end
                %- GLASS-AI classifications
                if not(isempty(app.UITable.Data{selected_rows(table_row),2}))
                    [~,classifications_name,~] = fileparts(app.UITable.Data{selected_rows(table_row),2});
                else
                    classifications_name = '';
                end
                %- manual annotations
                if not(isempty(app.UITable.Data{selected_rows(table_row),3}))
                    [~,annotations_name,~] = fileparts(app.UITable.Data{selected_rows(table_row),3});
                else
                    annotations_name = '';
                end

                % look for files based on selected column
                %- use switch to append different file extensions based on
                %- selected column
                switch selected_column
                    case 1 %get cell annotation files
                        % define name to search
                        if not(isempty(classifications_name))
                            search_name = classifications_name;
                        elseif not(isempty(annotations_name))
                            search_name = annotations_name;
                        end % if not(isempty(classifications_name))

                        %define cell annotation file type search priority
                        cell_annotation_search_order = {'.txt' '.csv'};
                        
                        %check for images matching search_name
                        for file_type = 1:size(cell_annotation_search_order,1)
                            search_file = [search_name cell_annotation_search_order{file_type}];

                            found_file = isfile(fullfile(new_directory,search_file));

                            if found_file
                                app.UITable.Data{selected_rows(table_row),selected_column} = search_file;
                                app.UITable.Data{selected_rows(table_row),selected_column+3} = new_directory;
                                break %no need to check other image types if found
                            else
                                continue
                            end % if found_file
                        end % for image_type = 1:size(image_type_search_order,1)

                    case 2 %get GLASS-AI classification files
                        %define name to search
                        if not(isempty(image_name))
                            search_name = image_name;
                        elseif not(isempty(annotations_name))
                            search_name = annotations_name;
                        end % if not(isempty(image_name))

                        search_file = [char(search_name) '_classes.mat'];
                        found_file = isfile(fullfile(new_directory,search_file));
                        if found_file
                            app.UITable.Data{selected_rows(table_row),selected_column} = search_file;
                            app.UITable.Data{selected_rows(table_row),selected_column+3} = new_directory;
                        else
                            continue
                        end % if found_file

                    case 3 %get tumor label masks
                        %define name to search
                        if not(isempty(image_name))
                            search_name = image_name;
                        elseif not(isempty(classifications_name))
                            search_name = classifications_name;
                        end % if not(isempty(image_name))

                        search_file = [char(search_name) '_tumor_labels.mat'];
                        found_file = isfile(fullfile(new_directory,search_file));
                        if found_file
                            app.UITable.Data{selected_rows(table_row),selected_column} = search_file;
                            app.UITable.Data{selected_rows(table_row),selected_column+3} = new_directory;
                        else
                            continue
                        end % if found_file
                
                end % switch selected_column

            end % for table_row = 1:size(selected_rows,1)
            
            % validate input files
            validateUITable(app)
        end

        % Close request function: UIFigure
        function UIFigureCloseRequest(app, event)
          
            % return to invoking directory in dev environment on app close
            if not(isdeployed)
                cd(app.START_DIR)
            end

            delete(app)
        end

        % Button pushed function: CopytobaseButton
        function CopytobaseButtonPushed(app, event)
                        % copy app to base workspace for debugging
            %- closing app window destroys data in the base variable too
            if not(isdeployed)
                assignin("base","app",app)
            end
        end

        % Value changed function: StainClassDropDown
        function StainClassDropDownValueChanged(app, event)
            %validate that values in selected column are the expected type
            variableName = 'Stain Class';
            acceptableClasses = {'string','char'};
            acceptableClassesSummary = 'text';
            selectedColumnName = app.StainClassDropDown.Value;

            tableValue = app.PREVIEW_CELLTABLE{1,selectedColumnName};
            %extract value from cell if stored that way in table
            if matches(class(tableValue),'cell')
                tableValue = tableValue{1};
            end

            %attempt to convert to text if that is what is expected
            if matches(acceptableClassesSummary,'text')
                tableValue = num2str(tableValue);
            end
            
            valueClass = class(tableValue);
           
            if sum(matches(acceptableClasses,valueClass)) == 1
                %do stuff if class is an expected type
                runstainimagenameregex(app);
            else 
                %alert user that class is not expected type and reset
                %dropdown
                wrongDataTypeAlertTitle = sprintf("Incorrect data type (%s)",variableName);
                wrongDataTypeAlertMessage = sprintf("The selected column did not contain data of the expected type: %s.\nInstead it contained data of the type: %s\nPlease select a different column",acceptableClassesSummary,valueClass);
                uialert(app.UIFigure,wrongDataTypeAlertMessage,wrongDataTypeAlertTitle,"Icon","error")
                app.StainClassDropDown.Value =  '';
            end

            resetvalidationchecks(app);
        end

        % Value changed function: StainIntensityDropDown
        function StainIntensityDropDownValueChanged(app, event)
            %validate that values in selected column are the expected type
            variableName = 'Stain Intensity';
            acceptableClasses = {'double','single','uint8','uint16'};
            acceptableClassesSummary = 'numeric';
            selectedColumnName = app.StainIntensityDropDown.Value;

            tableValue = app.PREVIEW_CELLTABLE{1,selectedColumnName};
            %extract value from cell if stored that way in table
            if matches(class(tableValue),'cell')
                tableValue = tableValue{1};
            end

            %attempt to convert to text if that is what is expected
            if matches(acceptableClassesSummary,'text')
                tableValue = num2str(tableValue);
            end
            
            valueClass = class(tableValue);
           
            if sum(matches(acceptableClasses,valueClass)) == 1
                %do stuff if class is an expected type
                runstainimagenameregex(app);
            else 
                %alert user that class is not expected type and reset
                %dropdown
                wrongDataTypeAlertTitle = sprintf("Incorrect data type (%s)",variableName);
                wrongDataTypeAlertMessage = sprintf("The selected column did not contain data of the expected type: %s.\nInstead it contained data of the type: %s\nPlease select a different column",acceptableClassesSummary,valueClass);
                uialert(app.UIFigure,wrongDataTypeAlertMessage,wrongDataTypeAlertTitle,"Icon","error")
                app.StainIntensityDropDown.Value =  '';
            end

            resetvalidationchecks(app);
        end

        % Value changed function: XPositionDropDown
        function XPositionDropDownValueChanged(app, event)
            %validate that values in selected column are the expected type
            variableName = 'X Position';
            acceptableClasses = {'double','single','uint8','uint16'};
            acceptableClassesSummary = 'numeric';
            selectedColumnName = app.XPositionDropDown.Value;

            tableValue = app.PREVIEW_CELLTABLE{1,selectedColumnName};
            %extract value from cell if stored that way in table
            if matches(class(tableValue),'cell')
                tableValue = tableValue{1};
            end

            %attempt to convert to text if that is what is expected
            if matches(acceptableClassesSummary,'text')
                tableValue = num2str(tableValue);
            end
            
            valueClass = class(tableValue);
           
            if sum(matches(acceptableClasses,valueClass)) == 1
                %do stuff if class is an expected type
                runstainimagenameregex(app);
            else 
                %alert user that class is not expected type and reset
                %dropdown
                wrongDataTypeAlertTitle = sprintf("Incorrect data type (%s)",variableName);
                wrongDataTypeAlertMessage = sprintf("The selected column did not contain data of the expected type: %s.\nInstead it contained data of the type: %s\nPlease select a different column",acceptableClassesSummary,valueClass);
                uialert(app.UIFigure,wrongDataTypeAlertMessage,wrongDataTypeAlertTitle,"Icon","error")
                app.XPositionDropDown.Value =  '';
            end

            resetvalidationchecks(app);
        end

        % Value changed function: YPositionDropDown
        function YPositionDropDownValueChanged(app, event)
            %validate that values in selected column are the expected type
            variableName = 'Y Position';
            acceptableClasses = {'double','single','uint8','uint16'};
            acceptableClassesSummary = 'numeric';
            selectedColumnName = app.YPositionDropDown.Value;

            tableValue = app.PREVIEW_CELLTABLE{1,selectedColumnName};
            %extract value from cell if stored that way in table
            if matches(class(tableValue),'cell')
                tableValue = tableValue{1};
            end

            %attempt to convert to text if that is what is expected
            if matches(acceptableClassesSummary,'text')
                tableValue = num2str(tableValue);
            end
            
            valueClass = class(tableValue);
           
            if sum(matches(acceptableClasses,valueClass)) == 1
                %do stuff if class is an expected type
                runstainimagenameregex(app);
            else 
                %alert user that class is not expected type and reset
                %dropdown
                wrongDataTypeAlertTitle = sprintf("Incorrect data type (%s)",variableName);
                wrongDataTypeAlertMessage = sprintf("The selected column did not contain data of the expected type: %s.\nInstead it contained data of the type: %s\nPlease select a different column",acceptableClassesSummary,valueClass);
                uialert(app.UIFigure,wrongDataTypeAlertMessage,wrongDataTypeAlertTitle,"Icon","error")
                app.YPositionDropDown.Value =  '';
            end

            resetvalidationchecks(app);
            
        end

        % Value changed function: StainECDFPreviewFileDropDown
        function StainECDFPreviewFileDropDownValueChanged(app, event)
            value = app.StainECDFPreviewFileDropDown.Value;
            app.VariablePreviewDropDown.Value = value;
            app.PreviewFileChanged
            
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 715 505];
            app.UIFigure.Name = 'MATLAB App';
            app.UIFigure.Resize = 'off';
            app.UIFigure.CloseRequestFcn = createCallbackFcn(app, @UIFigureCloseRequest, true);

            % Create WorkflowButtonGroup
            app.WorkflowButtonGroup = uibuttongroup(app.UIFigure);
            app.WorkflowButtonGroup.SelectionChangedFcn = createCallbackFcn(app, @WorkflowButtonGroupSelectionChanged, true);
            app.WorkflowButtonGroup.Title = '  ';
            app.WorkflowButtonGroup.Position = [0 -1 187 508];

            % Create ColumnAssignmentButton
            app.ColumnAssignmentButton = uitogglebutton(app.WorkflowButtonGroup);
            app.ColumnAssignmentButton.Text = 'Column Assignment';
            app.ColumnAssignmentButton.Position = [14 313 123 23];

            % Create CustomizeStainThresholdsButton
            app.CustomizeStainThresholdsButton = uitogglebutton(app.WorkflowButtonGroup);
            app.CustomizeStainThresholdsButton.Text = 'Customize Stain Thresholds';
            app.CustomizeStainThresholdsButton.Position = [14 243 165 23];

            % Create PeritumorAnalysisSettingsButton
            app.PeritumorAnalysisSettingsButton = uitogglebutton(app.WorkflowButtonGroup);
            app.PeritumorAnalysisSettingsButton.Text = 'Peritumor Analysis Settings';
            app.PeritumorAnalysisSettingsButton.Position = [14 278 162 23];

            % Create FileLoadingButton
            app.FileLoadingButton = uitogglebutton(app.WorkflowButtonGroup);
            app.FileLoadingButton.Text = 'File Loading';
            app.FileLoadingButton.Position = [13 348 100 23];
            app.FileLoadingButton.Value = true;

            % Create RunButton
            app.RunButton = uibutton(app.WorkflowButtonGroup, 'push');
            app.RunButton.ButtonPushedFcn = createCallbackFcn(app, @RunButtonPushed, true);
            app.RunButton.FontSize = 24;
            app.RunButton.FontWeight = 'bold';
            app.RunButton.Enable = 'off';
            app.RunButton.Position = [14 11 158 44];
            app.RunButton.Text = 'Run';

            % Create CopytobaseButton
            app.CopytobaseButton = uibutton(app.WorkflowButtonGroup, 'push');
            app.CopytobaseButton.ButtonPushedFcn = createCallbackFcn(app, @CopytobaseButtonPushed, true);
            app.CopytobaseButton.Enable = 'off';
            app.CopytobaseButton.Visible = 'off';
            app.CopytobaseButton.Position = [41 130 100 23];
            app.CopytobaseButton.Text = 'Copy to base';

            % Create VersionLabel
            app.VersionLabel = uilabel(app.WorkflowButtonGroup);
            app.VersionLabel.HorizontalAlignment = 'center';
            app.VersionLabel.VerticalAlignment = 'bottom';
            app.VersionLabel.FontColor = [0.651 0.651 0.651];
            app.VersionLabel.Position = [-1 487 187 20];
            app.VersionLabel.Text = 'Stained GLASS-AI v#.#';

            % Create AppIcon
            app.AppIcon = uiimage(app.WorkflowButtonGroup);
            app.AppIcon.Position = [14 380 158 100];

            % Create FileLoadingPanel
            app.FileLoadingPanel = uipanel(app.UIFigure);
            app.FileLoadingPanel.Position = [-478 -577 530 508];

            % Create SelectOutputFolder
            app.SelectOutputFolder = uibutton(app.FileLoadingPanel, 'push');
            app.SelectOutputFolder.ButtonPushedFcn = createCallbackFcn(app, @SelectOutputFolderButtonPushed, true);
            app.SelectOutputFolder.Position = [42 90 192 23];
            app.SelectOutputFolder.Text = 'Select output folder';

            % Create OutputFolderLabel
            app.OutputFolderLabel = uitextarea(app.FileLoadingPanel);
            app.OutputFolderLabel.Editable = 'off';
            app.OutputFolderLabel.Placeholder = 'optional (@ GLASS-AI annot.)';
            app.OutputFolderLabel.Position = [255 90 234 22];

            % Create StainNameEditFieldLabel
            app.StainNameEditFieldLabel = uilabel(app.FileLoadingPanel);
            app.StainNameEditFieldLabel.HorizontalAlignment = 'right';
            app.StainNameEditFieldLabel.Position = [165 122 67 22];
            app.StainNameEditFieldLabel.Text = 'Stain Name';

            % Create StainNameEditField
            app.StainNameEditField = uieditfield(app.FileLoadingPanel, 'text');
            app.StainNameEditField.Placeholder = 'STAIN';
            app.StainNameEditField.Position = [255 122 100 22];

            % Create UITable
            app.UITable = uitable(app.FileLoadingPanel);
            app.UITable.ColumnName = {'Cell Annotation(s)'; 'GLASS-AI Results'; 'Tumor Label Mask'; 'CellAnnotationPath'; 'ClassificationPath'; 'TumorLabelMaskPath'};
            app.UITable.ColumnWidth = {150, 150, 150, 0, 0, 0};
            app.UITable.RowName = {};
            app.UITable.ColumnSortable = true;
            app.UITable.CellEditCallback = createCallbackFcn(app, @UITableCellEdit, true);
            app.UITable.DoubleClickedFcn = createCallbackFcn(app, @UITableDoubleClicked, true);
            app.UITable.SelectionChangedFcn = createCallbackFcn(app, @UITableSelectionChanged, true);
            app.UITable.BusyAction = 'cancel';
            app.UITable.Interruptible = 'off';
            app.UITable.Position = [42 150 447 278];

            % Create SelectGLASSAIclassificationsButton
            app.SelectGLASSAIclassificationsButton = uibutton(app.FileLoadingPanel, 'push');
            app.SelectGLASSAIclassificationsButton.ButtonPushedFcn = createCallbackFcn(app, @SelectGLASSAIclassificationsButtonPushed, true);
            app.SelectGLASSAIclassificationsButton.Tooltip = {'Select the directory that contains your images for analysis. All SVS and TIFF images in the selected directory will be displayed in File Name Table below for selection.'};
            app.SelectGLASSAIclassificationsButton.Position = [203 446 131 38];
            app.SelectGLASSAIclassificationsButton.Text = {'Select GLASS-AI'; 'classification(s)'};

            % Create SelectcellannotationsButton
            app.SelectcellannotationsButton = uibutton(app.FileLoadingPanel, 'push');
            app.SelectcellannotationsButton.ButtonPushedFcn = createCallbackFcn(app, @SelectcellannotationsButtonPushed, true);
            app.SelectcellannotationsButton.Tooltip = {'Select the directory that contains your images for analysis. All SVS and TIFF images in the selected directory will be displayed in File Name Table below for selection.'};
            app.SelectcellannotationsButton.Position = [60 446 106 38];
            app.SelectcellannotationsButton.Text = {'Select '; 'cell annotation(s)'};

            % Create SelecttumorlabelmasksButton
            app.SelecttumorlabelmasksButton = uibutton(app.FileLoadingPanel, 'push');
            app.SelecttumorlabelmasksButton.ButtonPushedFcn = createCallbackFcn(app, @SelecttumorlabelmasksButtonPushed, true);
            app.SelecttumorlabelmasksButton.Tooltip = {'Select the directory that contains your images for analysis. All SVS and TIFF images in the selected directory will be displayed in File Name Table below for selection.'};
            app.SelecttumorlabelmasksButton.Position = [368 446 100 38];
            app.SelecttumorlabelmasksButton.Text = {'Select tumor'; 'label mask(s)'};

            % Create CellAnnotationPanel
            app.CellAnnotationPanel = uipanel(app.UIFigure);
            app.CellAnnotationPanel.Position = [69 -577 408 508];

            % Create SwapnameregexsButton
            app.SwapnameregexsButton = uibutton(app.CellAnnotationPanel, 'push');
            app.SwapnameregexsButton.ButtonPushedFcn = createCallbackFcn(app, @SwapnameregexsButtonPushed, true);
            app.SwapnameregexsButton.Position = [316 278 57 131];
            app.SwapnameregexsButton.Text = {'Swap'; 'name'; 'regexs'};

            % Create ValidateCellAnnotationFilesVariablesButton
            app.ValidateCellAnnotationFilesVariablesButton = uibutton(app.CellAnnotationPanel, 'push');
            app.ValidateCellAnnotationFilesVariablesButton.ButtonPushedFcn = createCallbackFcn(app, @ValidateCellAnnotationFilesVariablesButtonPushed, true);
            app.ValidateCellAnnotationFilesVariablesButton.IconAlignment = 'right';
            app.ValidateCellAnnotationFilesVariablesButton.Position = [103 64 152 35];
            app.ValidateCellAnnotationFilesVariablesButton.Text = 'Validate variables in files';

            % Create CellAnnotationFileVariablesLamp
            app.CellAnnotationFileVariablesLamp = uilamp(app.CellAnnotationPanel);
            app.CellAnnotationFileVariablesLamp.Visible = 'off';
            app.CellAnnotationFileVariablesLamp.Position = [260 71 20 20];

            % Create InvertXAxisCheckBox
            app.InvertXAxisCheckBox = uicheckbox(app.CellAnnotationPanel);
            app.InvertXAxisCheckBox.Tooltip = {'Invert the X coordinate of cell annotations ot account for differences in origin between the cellular analysis program and MATLAB. (MATLAB uses a top-left origin, so larger X values are closer to the right of an image)'};
            app.InvertXAxisCheckBox.Text = 'Invert X Axis';
            app.InvertXAxisCheckBox.Position = [70 110 89 22];

            % Create InvertYAxisCheckBox
            app.InvertYAxisCheckBox = uicheckbox(app.CellAnnotationPanel);
            app.InvertYAxisCheckBox.Tooltip = {'Invert the Y coordinate of cell annotations ot account for differences in origin between the cellular analysis program and MATLAB. (MATLAB uses a top-left origin, so larger Y values are closer to the bottom of an image)'};
            app.InvertYAxisCheckBox.Text = 'Invert Y Axis';
            app.InvertYAxisCheckBox.Position = [204 110 89 22];

            % Create HEimagenameLabel
            app.HEimagenameLabel = uilabel(app.CellAnnotationPanel);
            app.HEimagenameLabel.HorizontalAlignment = 'right';
            app.HEimagenameLabel.Position = [38 418 98 22];
            app.HEimagenameLabel.Text = 'H&E image name';

            % Create HEImageNameDropDown
            app.HEImageNameDropDown = uidropdown(app.CellAnnotationPanel);
            app.HEImageNameDropDown.Items = {};
            app.HEImageNameDropDown.ValueChangedFcn = createCallbackFcn(app, @HEImageNameDropDownValueChanged, true);
            app.HEImageNameDropDown.Placeholder = 'Select column name';
            app.HEImageNameDropDown.Position = [151 418 142 22];
            app.HEImageNameDropDown.Value = {};

            % Create StainclassDropDownLabel
            app.StainclassDropDownLabel = uilabel(app.CellAnnotationPanel);
            app.StainclassDropDownLabel.HorizontalAlignment = 'right';
            app.StainclassDropDownLabel.Position = [72 251 64 22];
            app.StainclassDropDownLabel.Text = 'Stain class';

            % Create StainClassDropDown
            app.StainClassDropDown = uidropdown(app.CellAnnotationPanel);
            app.StainClassDropDown.Items = {};
            app.StainClassDropDown.ValueChangedFcn = createCallbackFcn(app, @StainClassDropDownValueChanged, true);
            app.StainClassDropDown.Placeholder = 'Select column name';
            app.StainClassDropDown.Position = [151 251 142 22];
            app.StainClassDropDown.Value = {};

            % Create StainIntensityDropDownLabel
            app.StainIntensityDropDownLabel = uilabel(app.CellAnnotationPanel);
            app.StainIntensityDropDownLabel.HorizontalAlignment = 'right';
            app.StainIntensityDropDownLabel.Position = [55 224 81 22];
            app.StainIntensityDropDownLabel.Text = 'Stain Intensity';

            % Create StainIntensityDropDown
            app.StainIntensityDropDown = uidropdown(app.CellAnnotationPanel);
            app.StainIntensityDropDown.Items = {};
            app.StainIntensityDropDown.ValueChangedFcn = createCallbackFcn(app, @StainIntensityDropDownValueChanged, true);
            app.StainIntensityDropDown.Placeholder = 'Optional';
            app.StainIntensityDropDown.Position = [151 224 142 22];
            app.StainIntensityDropDown.Value = {};

            % Create XpositionDropDownLabel
            app.XpositionDropDownLabel = uilabel(app.CellAnnotationPanel);
            app.XpositionDropDownLabel.HorizontalAlignment = 'right';
            app.XpositionDropDownLabel.Position = [78 197 58 22];
            app.XpositionDropDownLabel.Text = 'X position';

            % Create XPositionDropDown
            app.XPositionDropDown = uidropdown(app.CellAnnotationPanel);
            app.XPositionDropDown.Items = {};
            app.XPositionDropDown.ValueChangedFcn = createCallbackFcn(app, @XPositionDropDownValueChanged, true);
            app.XPositionDropDown.Placeholder = 'Select column name';
            app.XPositionDropDown.Position = [151 197 142 22];
            app.XPositionDropDown.Value = {};

            % Create YpositionDropDownLabel
            app.YpositionDropDownLabel = uilabel(app.CellAnnotationPanel);
            app.YpositionDropDownLabel.HorizontalAlignment = 'right';
            app.YpositionDropDownLabel.Position = [78 170 58 22];
            app.YpositionDropDownLabel.Text = 'Y position';

            % Create YPositionDropDown
            app.YPositionDropDown = uidropdown(app.CellAnnotationPanel);
            app.YPositionDropDown.Items = {};
            app.YPositionDropDown.ValueChangedFcn = createCallbackFcn(app, @YPositionDropDownValueChanged, true);
            app.YPositionDropDown.Placeholder = 'Select column name';
            app.YPositionDropDown.Position = [151 170 142 22];
            app.YPositionDropDown.Value = {};

            % Create PositionunitDropDownLabel
            app.PositionunitDropDownLabel = uilabel(app.CellAnnotationPanel);
            app.PositionunitDropDownLabel.HorizontalAlignment = 'right';
            app.PositionunitDropDownLabel.Position = [65 143 71 22];
            app.PositionunitDropDownLabel.Text = 'Position unit';

            % Create PositionUnitDropDown
            app.PositionUnitDropDown = uidropdown(app.CellAnnotationPanel);
            app.PositionUnitDropDown.Items = {'pixel', 'micrometer', 'millimeter', 'inch'};
            app.PositionUnitDropDown.Position = [151 143 142 22];
            app.PositionUnitDropDown.Value = 'pixel';

            % Create PreviewfileDropDown_2Label
            app.PreviewfileDropDown_2Label = uilabel(app.CellAnnotationPanel);
            app.PreviewfileDropDown_2Label.HorizontalAlignment = 'right';
            app.PreviewfileDropDown_2Label.Position = [69 446 67 22];
            app.PreviewfileDropDown_2Label.Text = 'Preview file';

            % Create VariablePreviewDropDown
            app.VariablePreviewDropDown = uidropdown(app.CellAnnotationPanel);
            app.VariablePreviewDropDown.Items = {};
            app.VariablePreviewDropDown.ValueChangedFcn = createCallbackFcn(app, @PreviewFileChanged, true);
            app.VariablePreviewDropDown.Placeholder = 'Select file';
            app.VariablePreviewDropDown.Position = [151 446 142 22];
            app.VariablePreviewDropDown.Value = {};

            % Create HEimagenameLabel_2
            app.HEimagenameLabel_2 = uilabel(app.CellAnnotationPanel);
            app.HEimagenameLabel_2.HorizontalAlignment = 'right';
            app.HEimagenameLabel_2.Position = [22 334 115 22];
            app.HEimagenameLabel_2.Text = 'Stained image name';

            % Create StainImageNameDropDown
            app.StainImageNameDropDown = uidropdown(app.CellAnnotationPanel);
            app.StainImageNameDropDown.Items = {};
            app.StainImageNameDropDown.ValueChangedFcn = createCallbackFcn(app, @StainImageNameDropDownValueChanged, true);
            app.StainImageNameDropDown.Placeholder = 'Select column name';
            app.StainImageNameDropDown.Position = [151 334 142 22];
            app.StainImageNameDropDown.Value = {};

            % Create ImagenameextractorregexLabel_2
            app.ImagenameextractorregexLabel_2 = uilabel(app.CellAnnotationPanel);
            app.ImagenameextractorregexLabel_2.HorizontalAlignment = 'right';
            app.ImagenameextractorregexLabel_2.Position = [22 299 115 30];
            app.ImagenameextractorregexLabel_2.Text = {'Stained image name'; 'extractor regex'};

            % Create StainImageNameRegexEditField
            app.StainImageNameRegexEditField = uieditfield(app.CellAnnotationPanel, 'text');
            app.StainImageNameRegexEditField.ValueChangedFcn = createCallbackFcn(app, @StainImageNameRegexEditFieldValueChanged, true);
            app.StainImageNameRegexEditField.Tooltip = {'Define a regular expression to extract the image name from the selected column. Leaving blank will use the value in the column as-is. Default to extract alphnumeric image name beforet  the first ''_'' in a string: (?<=^)([a-zA-Z0-9]*)(?=_.*$)'};
            app.StainImageNameRegexEditField.Position = [151 304 142 22];
            app.StainImageNameRegexEditField.Value = '(?<=^)([a-zA-Z0-9]*)(?=_.*$)';

            % Create ResultEditFieldLabel_2
            app.ResultEditFieldLabel_2 = uilabel(app.CellAnnotationPanel);
            app.ResultEditFieldLabel_2.HorizontalAlignment = 'right';
            app.ResultEditFieldLabel_2.Enable = 'off';
            app.ResultEditFieldLabel_2.Position = [150 278 40 22];
            app.ResultEditFieldLabel_2.Text = 'Result';

            % Create StainRegexResultEditField
            app.StainRegexResultEditField = uieditfield(app.CellAnnotationPanel, 'text');
            app.StainRegexResultEditField.Editable = 'off';
            app.StainRegexResultEditField.Enable = 'off';
            app.StainRegexResultEditField.Position = [193 278 100 22];

            % Create ImagenameextractorregexLabel
            app.ImagenameextractorregexLabel = uilabel(app.CellAnnotationPanel);
            app.ImagenameextractorregexLabel.HorizontalAlignment = 'right';
            app.ImagenameextractorregexLabel.Position = [38 382 98 30];
            app.ImagenameextractorregexLabel.Text = {'H&E image name'; 'extractor regex'};

            % Create HEImageNameRegexEditField
            app.HEImageNameRegexEditField = uieditfield(app.CellAnnotationPanel, 'text');
            app.HEImageNameRegexEditField.ValueChangedFcn = createCallbackFcn(app, @HEImageNameRegexEditFieldValueChanged, true);
            app.HEImageNameRegexEditField.Tooltip = {'Define a regular expression to extract the image name from the selected column. Leaving blank will use the value in the column as-is. Default to extract alphnumeric image name between the first ''_'' and the next ''_'' or space in a string: (?<=_)([a-zA-Z0-9]*)(?=_.*$)'};
            app.HEImageNameRegexEditField.Position = [151 387 142 22];
            app.HEImageNameRegexEditField.Value = '(?<=_)([a-zA-Z0-9]*)(?=[\ _].*$)';

            % Create ResultEditFieldLabel
            app.ResultEditFieldLabel = uilabel(app.CellAnnotationPanel);
            app.ResultEditFieldLabel.HorizontalAlignment = 'right';
            app.ResultEditFieldLabel.Enable = 'off';
            app.ResultEditFieldLabel.Position = [150 361 40 22];
            app.ResultEditFieldLabel.Text = 'Result';

            % Create HERegexResultEditField
            app.HERegexResultEditField = uieditfield(app.CellAnnotationPanel, 'text');
            app.HERegexResultEditField.Editable = 'off';
            app.HERegexResultEditField.Enable = 'off';
            app.HERegexResultEditField.Position = [193 361 100 22];

            % Create StainThresholdPanel
            app.StainThresholdPanel = uipanel(app.UIFigure);
            app.StainThresholdPanel.Position = [922 -577 405 508];

            % Create StainECDFAxes
            app.StainECDFAxes = uiaxes(app.StainThresholdPanel);
            xlabel(app.StainECDFAxes, 'Stain intensity')
            ylabel(app.StainECDFAxes, 'Cumulative Frequency')
            zlabel(app.StainECDFAxes, 'Z')
            app.StainECDFAxes.YTick = [0 1];
            app.StainECDFAxes.YTickLabel = {'0'; '100'};
            app.StainECDFAxes.YGrid = 'on';
            app.StainECDFAxes.YMinorGrid = 'on';
            app.StainECDFAxes.Position = [9 16 388 257];

            % Create UseCustomThesholdCheckBox
            app.UseCustomThesholdCheckBox = uicheckbox(app.StainThresholdPanel);
            app.UseCustomThesholdCheckBox.Enable = 'off';
            app.UseCustomThesholdCheckBox.Text = 'Use new thresholds for analysis?';
            app.UseCustomThesholdCheckBox.Position = [133 273 200 22];

            % Create RefreshStainECDFPlotButton
            app.RefreshStainECDFPlotButton = uibutton(app.StainThresholdPanel, 'push');
            app.RefreshStainECDFPlotButton.ButtonPushedFcn = createCallbackFcn(app, @RefreshStainECDFPlotButtonPushed, true);
            app.RefreshStainECDFPlotButton.Position = [221 329 100 22];
            app.RefreshStainECDFPlotButton.Text = 'Refresh plot';

            % Create PreviewfileDropDownLabel
            app.PreviewfileDropDownLabel = uilabel(app.StainThresholdPanel);
            app.PreviewfileDropDownLabel.HorizontalAlignment = 'right';
            app.PreviewfileDropDownLabel.Position = [29 471 67 22];
            app.PreviewfileDropDownLabel.Text = 'Preview file';

            % Create StainECDFPreviewFileDropDown
            app.StainECDFPreviewFileDropDown = uidropdown(app.StainThresholdPanel);
            app.StainECDFPreviewFileDropDown.Items = {''};
            app.StainECDFPreviewFileDropDown.ValueChangedFcn = createCallbackFcn(app, @StainECDFPreviewFileDropDownValueChanged, true);
            app.StainECDFPreviewFileDropDown.Placeholder = 'Select file';
            app.StainECDFPreviewFileDropDown.Position = [111 471 153 22];
            app.StainECDFPreviewFileDropDown.Value = '';

            % Create StainthresholdsEditFieldLabel
            app.StainthresholdsEditFieldLabel = uilabel(app.StainThresholdPanel);
            app.StainthresholdsEditFieldLabel.HorizontalAlignment = 'right';
            app.StainthresholdsEditFieldLabel.Position = [4 446 92 22];
            app.StainthresholdsEditFieldLabel.Text = 'Stain thresholds';

            % Create StainThresholdsEditField
            app.StainThresholdsEditField = uieditfield(app.StainThresholdPanel, 'text');
            app.StainThresholdsEditField.ValueChangedFcn = createCallbackFcn(app, @StainThresholdsEditFieldValueChanged, true);
            app.StainThresholdsEditField.Placeholder = 'Input value(s)';
            app.StainThresholdsEditField.Position = [111 446 153 22];

            % Create StainClassNamesTextArea
            app.StainClassNamesTextArea = uitextarea(app.StainThresholdPanel);
            app.StainClassNamesTextArea.ValueChangedFcn = createCallbackFcn(app, @StainClassNamesTextAreaValueChanged, true);
            app.StainClassNamesTextArea.Placeholder = 'Input class name(s), one on each line';
            app.StainClassNamesTextArea.Position = [111 358 153 77];

            % Create ClassnamesTextAreaLabel
            app.ClassnamesTextAreaLabel = uilabel(app.StainThresholdPanel);
            app.ClassnamesTextAreaLabel.HorizontalAlignment = 'right';
            app.ClassnamesTextAreaLabel.Position = [9 410 75 22];
            app.ClassnamesTextAreaLabel.Text = 'Class names';

            % Create negative1low2medium3highLabel
            app.negative1low2medium3highLabel = uilabel(app.StainThresholdPanel);
            app.negative1low2medium3highLabel.Position = [317 373 79 59];
            app.negative1low2medium3highLabel.Text = {'0 = (negative)'; '1 = (low)'; '2 = (medium)'; '3 = (high)'};

            % Create HScoreTextAreaLabel
            app.HScoreTextAreaLabel = uilabel(app.StainThresholdPanel);
            app.HScoreTextAreaLabel.HorizontalAlignment = 'right';
            app.HScoreTextAreaLabel.FontWeight = 'bold';
            app.HScoreTextAreaLabel.Position = [267 434 51 22];
            app.HScoreTextAreaLabel.Text = 'H-Score';

            % Create HScoreTextArea
            app.HScoreTextArea = uitextarea(app.StainThresholdPanel);
            app.HScoreTextArea.ValueChangedFcn = createCallbackFcn(app, @HScoreTextAreaValueChanged, true);
            app.HScoreTextArea.Position = [271 358 43 77];
            app.HScoreTextArea.Value = {'0'; '1'; '2'; '3'};

            % Create PeritumorPanel
            app.PeritumorPanel = uipanel(app.UIFigure);
            app.PeritumorPanel.Position = [493 -577 408 508];

            % Create PeritumorDemoAxes
            app.PeritumorDemoAxes = uiaxes(app.PeritumorPanel);
            title(app.PeritumorDemoAxes, 'Peritumor distance demo')
            app.PeritumorDemoAxes.XTick = [];
            app.PeritumorDemoAxes.YTick = [];
            app.PeritumorDemoAxes.ZTick = [];
            app.PeritumorDemoAxes.TitleHorizontalAlignment = 'left';
            app.PeritumorDemoAxes.Position = [6 7 399 355];

            % Create PeritumorcutoffdistancesLabel
            app.PeritumorcutoffdistancesLabel = uilabel(app.PeritumorPanel);
            app.PeritumorcutoffdistancesLabel.HorizontalAlignment = 'right';
            app.PeritumorcutoffdistancesLabel.Position = [12 471 153 22];
            app.PeritumorcutoffdistancesLabel.Text = 'Peritumor cutoff distance(s)';

            % Create PeritumorShoreIntervalsEditField
            app.PeritumorShoreIntervalsEditField = uieditfield(app.PeritumorPanel, 'text');
            app.PeritumorShoreIntervalsEditField.ValueChangedFcn = createCallbackFcn(app, @PeritumorShoreIntervalsEditFieldValueChanged, true);
            app.PeritumorShoreIntervalsEditField.Placeholder = 'Input value(s)';
            app.PeritumorShoreIntervalsEditField.Position = [180 471 216 22];
            app.PeritumorShoreIntervalsEditField.Value = '50, 100, 150, 200, 250';

            % Create PeritumorcolormapDropDownLabel
            app.PeritumorcolormapDropDownLabel = uilabel(app.PeritumorPanel);
            app.PeritumorcolormapDropDownLabel.HorizontalAlignment = 'right';
            app.PeritumorcolormapDropDownLabel.Position = [12 443 115 22];
            app.PeritumorcolormapDropDownLabel.Text = 'Peritumor color map';

            % Create PeritumorcolormapDropDown
            app.PeritumorcolormapDropDown = uidropdown(app.PeritumorPanel);
            app.PeritumorcolormapDropDown.Items = {'default', 'autumn', 'spring', 'summer', 'winter', 'gray', 'bone', 'copper', 'pink', 'jet', 'cool', 'turbo', 'hsv', 'parula'};
            app.PeritumorcolormapDropDown.ValueChangedFcn = createCallbackFcn(app, @PeritumorcolormapDropDownValueChanged, true);
            app.PeritumorcolormapDropDown.Position = [180 443 100 22];
            app.PeritumorcolormapDropDown.Value = 'default';

            % Create InvertCheckBox
            app.InvertCheckBox = uicheckbox(app.PeritumorPanel);
            app.InvertCheckBox.ValueChangedFcn = createCallbackFcn(app, @InvertCheckBoxValueChanged, true);
            app.InvertCheckBox.Text = 'Invert?';
            app.InvertCheckBox.Position = [288 443 59 22];
            app.InvertCheckBox.Value = true;

            % Create TranparencySliderLabel
            app.TranparencySliderLabel = uilabel(app.PeritumorPanel);
            app.TranparencySliderLabel.HorizontalAlignment = 'right';
            app.TranparencySliderLabel.Position = [12 415 71 22];
            app.TranparencySliderLabel.Text = 'Tranparency';

            % Create PeritumorTranparencySlider
            app.PeritumorTranparencySlider = uislider(app.PeritumorPanel);
            app.PeritumorTranparencySlider.Limits = [0 1];
            app.PeritumorTranparencySlider.MajorTicks = [0 0.2 0.4 0.6 0.8 1];
            app.PeritumorTranparencySlider.ValueChangedFcn = createCallbackFcn(app, @PeritumorTranparencySliderValueChanged, true);
            app.PeritumorTranparencySlider.MinorTicks = [];
            app.PeritumorTranparencySlider.Position = [180 429 213 3];
            app.PeritumorTranparencySlider.Value = 0.4;

            % Create UITableContextMenu
            app.UITableContextMenu = uicontextmenu(app.UIFigure);

            % Create UnselectMenu
            app.UnselectMenu = uimenu(app.UITableContextMenu);
            app.UnselectMenu.MenuSelectedFcn = createCallbackFcn(app, @UnselectMenuSelected, true);
            app.UnselectMenu.Text = 'Unselect';

            % Create ClearMenu
            app.ClearMenu = uimenu(app.UITableContextMenu);
            app.ClearMenu.Text = 'Clear';

            % Create ClearSelection
            app.ClearSelection = uimenu(app.ClearMenu);
            app.ClearSelection.MenuSelectedFcn = createCallbackFcn(app, @ClearSelectionMenuSelected, true);
            app.ClearSelection.Text = 'Selection';

            % Create ClearRows
            app.ClearRows = uimenu(app.ClearMenu);
            app.ClearRows.MenuSelectedFcn = createCallbackFcn(app, @ClearRowsMenuSelected, true);
            app.ClearRows.Text = 'Row(s)';

            % Create ClearColumns
            app.ClearColumns = uimenu(app.ClearMenu);
            app.ClearColumns.MenuSelectedFcn = createCallbackFcn(app, @ClearColumnsMenuSelected, true);
            app.ClearColumns.Text = 'Column(s)';

            % Create ClearInvalidFiles
            app.ClearInvalidFiles = uimenu(app.ClearMenu);
            app.ClearInvalidFiles.MenuSelectedFcn = createCallbackFcn(app, @ClearInvalidFilesMenuSelected, true);
            app.ClearInvalidFiles.Text = 'Invalid Files';

            % Create ChangeFolderMenu
            app.ChangeFolderMenu = uimenu(app.UITableContextMenu);
            app.ChangeFolderMenu.MenuSelectedFcn = createCallbackFcn(app, @ChangeFolderMenuSelected, true);
            app.ChangeFolderMenu.Enable = 'off';
            app.ChangeFolderMenu.Text = 'Change Folder';

            % Create PopulatefromFolderMenu
            app.PopulatefromFolderMenu = uimenu(app.UITableContextMenu);
            app.PopulatefromFolderMenu.MenuSelectedFcn = createCallbackFcn(app, @PopulatefromFolderMenuSelected, true);
            app.PopulatefromFolderMenu.Enable = 'off';
            app.PopulatefromFolderMenu.Text = 'Populate from Folder';
            
            % Assign app.UITableContextMenu
            app.UITable.ContextMenu = app.UITableContextMenu;

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = Stained_GLASS_app_exported

            runningApp = getRunningApp(app);

            % Check for running singleton app
            if isempty(runningApp)

                % Create UIFigure and components
                createComponents(app)

                % Register the app with App Designer
                registerApp(app, app.UIFigure)

                % Execute the startup function
                runStartupFcn(app, @startupFcn)
            else

                % Focus the running singleton app
                figure(runningApp.UIFigure)

                app = runningApp;
            end

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end