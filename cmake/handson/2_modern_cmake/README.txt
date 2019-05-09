Goal: Use a library which exports targets (already done in excercise one with boost) and write your own with export targets.

Topics:
- Use fetch_content to get a new gtest version
- Use the exported targets
- Export your library via a target
- Use and export a version number for your library (and a compatibility setting), in presentation side-remark about semver

TODO: Maybe, we can make up a library which creates a conflict
in the executable if some dependency is not correctly flagged as build private.

TODO: Example which uses an old gtest which doesn't export targets as starting point,
rewrite to use fetch_content with a recent one, and use export targets.

TODO: My feeling is that this session is quite packed.