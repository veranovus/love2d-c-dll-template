const std = @import("std");

pub fn build(b: *std.Build) void {

  const target   = b.standardTargetOptions(.{});
  const optimize = b.standardOptimizeOption(.{});

  const lib = b.addSharedLibrary(.{
    .name = "lovec",
    .target = target,
    .optimize = optimize,
  });

  lib.linkLibC();
  lib.addLibraryPath(b.path("lua/"));
  lib.linkSystemLibrary("lua51");
  lib.addCSourceFile(.{
    .file  = b.path("main.c"),
    .flags = &.{
      "-std=c99",
    },
  });

  const install = b.addInstallArtifact(lib, .{
    .dest_dir   = .{ .override = .{ .custom = "./" } },
    .pdb_dir    = .disabled,
    .h_dir      = .disabled,
    .implib_dir = .disabled,
  });
  b.default_step.dependOn(&install.step);
}
