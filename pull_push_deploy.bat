@cd /d E:\Code\hexo\BugBubbles.github.io
@echo Loading from reporsitory...
@git pull origin main
@git add -A
@git status
@ git commit -m modified_by_cbf && git push -u origin main && echo Your change has been SUCCESSFULLY pushed to the reporsitory
@hexo clean && hexo g && hexo d