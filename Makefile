DOTS = $(filter-out %.svn,$(filter-out %~,$(notdir $(wildcard ~/bin/dot/.??*))))

.PHONY: all permits

all: permits $(DOTS)

permits:
	chmod -R go-rxw ~/bin

$(DOTS):
	-rm -rf ~/$@
	ln -s ~/bin/dot/$@ ~/$@