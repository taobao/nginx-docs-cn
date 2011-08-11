
DOCS_RU =	ru/docs/faq						\

DOCS_RU_XML =	$(foreach name, $(DOCS_RU), xml/$(name).xml)
DOCS_RU_HTML =	$(foreach name, $(DOCS_RU), $(OUT)/$(name).html)

FAQ_RU =	ru/docs/sys_errlist					\

FAQ_RU_XML =	$(foreach name, $(FAQ_RU), xml/$(name).xml)
FAQ_RU_HTML =	$(foreach name, $(FAQ_RU), $(OUT)/$(name).html)

ru:									\
		$(OUT)/ru/index.html					\
		$(OUT)/ru/download.html					\
		$(OUT)/ru/support.html					\
		$(OUT)/ru/docs/index.html				\
		$(DOCS_RU_HTML)						\
		$(FAQ_RU_HTML)						\

$(OUT)/ru/download.html:	xml/ru/download.xml			\
		xml/menu.xml						\
		xslt/download.xslt					\
		dtd/article.dtd						\
		dtd/content.dtd
	$(call XSLT, xslt/download.xslt, $<, $@)

$(OUT)/ru/docs/faq.html:	xml/ru/docs/faq.xml			\
		$(ARTICLE_XSLT)						\
		$(FAQ_RU_XML)
	$(call XSLT, xslt/article.xslt, $<, $@)
