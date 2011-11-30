DOC_LANG =	he

DOCS =									\
		introduction						\
		howto							\
		windows							\

DOCS_XML =	$(foreach name, $(DOCS), xml/$(DOC_LANG)/docs/$(name).xml)
DOCS_HTML =	$(foreach name, $(DOCS), $(OUT)/$(DOC_LANG)/docs/$(name).html)

INTRO =									\
		http/server_names					\

INTRO_XML =	$(foreach name, $(INTRO), xml/$(DOC_LANG)/docs/$(name).xml)
INTRO_HTML =	$(foreach name, $(INTRO), $(OUT)/$(DOC_LANG)/docs/$(name).html)

HOWTO =									\
		http/converting_rewrite_rules				\

HOWTO_XML =	$(foreach name, $(HOWTO), xml/$(DOC_LANG)/docs/$(name).xml)
HOWTO_HTML =	$(foreach name, $(HOWTO), $(OUT)/$(DOC_LANG)/docs/$(name).html)

$(DOC_LANG):								\
		$(OUT)/$(DOC_LANG)/index.html				\
		$(OUT)/$(DOC_LANG)/docs/index.html			\
		$(DOCS_HTML)						\
		$(INTRO_HTML)						\
		$(HOWTO_HTML)						\

$(OUT)/$(DOC_LANG)/docs/index.html:					\
		$(DOCS_XML)						\

$(OUT)/$(DOC_LANG)/docs/introduction.html:				\
		$(INTRO_XML)						\

$(OUT)/$(DOC_LANG)/docs/howto.html:					\
		$(HOWTO_XML)						\
