DOC_LANG =	he

DOCS =									\
		windows							\
		http/server_names					\
		http/converting_rewrite_rules				\

DOCS_XML =	$(foreach name, $(DOCS), xml/$(DOC_LANG)/docs/$(name).xml)
DOCS_HTML =	$(foreach name, $(DOCS), $(OUT)/$(DOC_LANG)/docs/$(name).html)

$(DOC_LANG):								\
		$(OUT)/$(DOC_LANG)/index.html				\
		$(OUT)/$(DOC_LANG)/docs/index.html			\
		$(DOCS_HTML)						\

$(OUT)/$(DOC_LANG)/docs/index.html:					\
		$(DOCS_XML)						\
