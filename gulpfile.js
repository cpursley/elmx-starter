"use strict"

var gulp   = require('gulp'),
    insert = require('gulp-insert'),
    rename = require('gulp-rename'),
    elmx   = require('elmx');

var src = './src'

gulp.task('default', ['watch']);

gulp.task('build', function(cb) {
  return gulp.src(src + '/**/*.elmx')
    .pipe(insert.transform(elmx))
    .pipe(rename({extname: '.elm'}))
    .pipe(gulp.dest(src));
});

gulp.task('watch', ['build'], function() {
  return gulp.watch(src + '/**/*.elmx', ['build']);
});
