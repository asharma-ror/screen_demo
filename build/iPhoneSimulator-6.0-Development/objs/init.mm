extern "C" {
    void ruby_sysinit(int *, char ***);
    void ruby_init(void);
    void ruby_init_loadpath(void);
    void ruby_script(const char *);
    void ruby_set_argv(int, char **);
    void rb_vm_init_compiler(void);
    void rb_vm_init_jit(void);
    void rb_vm_aot_feature_provide(const char *, void *);
    void *rb_vm_top_self(void);
    void rb_rb2oc_exc_handler(void);
    void rb_exit(int);
void MREP_CC099192CAD34D56B7CDA4B8AD7A1D57(void *, void *);
void MREP_959D154F9F3943709D8C5D956966AB16(void *, void *);
void MREP_4434D49E3C75418F925A884ADA37E2A0(void *, void *);
void MREP_32BE3C38F8434847960AEF013ACE6495(void *, void *);
void MREP_93D38046CE8A49C9B5A67CFCA6DA08DF(void *, void *);
}

extern "C"
void
RubyMotionInit(int argc, char **argv)
{
    static bool initialized = false;
    if (!initialized) {
	ruby_init();
	ruby_init_loadpath();
        if (argc > 0) {
	    const char *progname = argv[0];
	    ruby_script(progname);
	}
#if !__LP64__
	try {
#endif
	    void *self = rb_vm_top_self();
MREP_CC099192CAD34D56B7CDA4B8AD7A1D57(self, 0);
MREP_959D154F9F3943709D8C5D956966AB16(self, 0);
MREP_4434D49E3C75418F925A884ADA37E2A0(self, 0);
MREP_32BE3C38F8434847960AEF013ACE6495(self, 0);
MREP_93D38046CE8A49C9B5A67CFCA6DA08DF(self, 0);
#if !__LP64__
	}
	catch (...) {
	    rb_rb2oc_exc_handler();
	}
#endif
	initialized = true;
    }
}
