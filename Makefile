build:
	jekyll build --incremental

upload:
	AWS_PROFILE=oxygene-sk-web aws s3 sync _site/ s3://oxygene-sk-web/

run:
	jekyll serve --incremental --watch
