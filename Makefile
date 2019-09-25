ARG:=INPUT_FILE

.PHONY: build
build:
	docker build -t tika-parser .

.PHONY: clean
clean:
	docker rmi tika-parser

.PHONY: run-parser-to-html
run-parser-to-html:
	@docker rm -f tika_paser >/dev/null 2>&1 \
	  ; docker run -d --name tika_paser tika-parser tail -f >/dev/null 2>&1
	@docker cp ${ARG} tika_paser:/
	@docker exec -it tika_paser java -jar /opt/tika/tika-app-1.22.jar -h ${ARG}
	@docker rm -f tika_paser

.PHONY: run-parser-to-text
run-parser-to-text:
	@docker rm -f tika_paser  >/dev/null 2>&1 \
	  ; docker run -d --name tika_paser tika-parser tail -f  >/dev/null 2>&1
	@docker cp ${ARG} tika_paser:/
	@docker exec -it tika_paser java -jar /opt/tika/tika-app-1.22.jar -t ${ARG}
	@docker rm -f tika_paser
