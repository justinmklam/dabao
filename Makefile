SCH_FILE := pcb/dabao/dabao.kicad_sch
PCB_FILE := pcb/dabao/dabao.kicad_pcb
OUTPUT_DIR := pcb/dabao/exports/
OUTPUT_PREFIX := $(OUTPUT_DIR)/dabao
# Space separated list of fields
BOM_EXTRA_FIELDS := Datasheet

export-kicad-pcb:
	@echo "--- Position file ---"
	@kicad-cli pcb export pos $(PCB_FILE) --format ascii --units mm --exclude-fp-th -o $(OUTPUT_PREFIX).pos

	@echo "--- Gerbers and Drill files ---"
	@mkdir $(OUTPUT_DIR)/tmp-gerbers
	@kicad-cli pcb export gerbers $(PCB_FILE) -o $(OUTPUT_DIR)/tmp-gerbers
	@kicad-cli pcb export drill $(PCB_FILE) -o $(OUTPUT_DIR)/tmp-gerbers/
	@(cd $(OUTPUT_DIR)/tmp-gerbers && zip -r ../gerbers.zip .)
	@rm -rf $(OUTPUT_DIR)/tmp-gerbers

	@echo "--- PDFs ---"
	@kicad-cli pcb export pdf $(PCB_FILE) -l "F.Paste,F.Mask,F.Silkscreen,Edge.Cuts" --ibt --black-and-white -o $(OUTPUT_PREFIX)-pcb-front.pdf
	@kicad-cli pcb export pdf $(PCB_FILE) -l "B.Paste,B.Mask,B.Silkscreen,Edge.Cuts" --ibt --black-and-white -o $(OUTPUT_PREFIX)-pcb-back.pdf

	@echo "--- STEP file ---"
	@kicad-cli pcb export step $(PCB_FILE) --subst-models -o $(OUTPUT_PREFIX).step

export-kicad-sch:
	@echo "--- Schematic ---"
	@kicad-cli sch export pdf $(SCH_FILE) -o $(OUTPUT_PREFIX)-schematic.pdf

	@echo "--- BOM ---"
	@kicad-cli sch export python-bom $(SCH_FILE) -o $(OUTPUT_PREFIX)-bom.xml
	@/usr/bin/python3 /usr/share/kicad/plugins/bom_csv_grouped_extra.py $(OUTPUT_PREFIX)-bom.xml $(OUTPUT_PREFIX)-bom.csv $(BOM_EXTRA_FIELDS)
	@rm $(OUTPUT_PREFIX)-bom.xml
	@echo "Saved to $(OUTPUT_PREFIX)-bom.csv"

export-kicad: export-kicad-sch export-kicad-pcb
