var gulp = require('gulp');
var coffeelint = require('gulp-coffeelint');

gulp.task('coffeeLint', function() {
  gulp.src('./src/**/*.coffee')
    .pipe(coffeelint({
      options: {
        'max_line_length': {
          level: 'ignore'
        }
      }
    }))
    .pipe(coffeelint.reporter());
});
