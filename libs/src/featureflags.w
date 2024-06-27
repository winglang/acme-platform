pub class FeatureFlags {
  new() {
    // environment specific init code  
  }

  extern "./featureflags/ld.ts" 
  pub inflight static variation(key: str, context: Json): str; 
}