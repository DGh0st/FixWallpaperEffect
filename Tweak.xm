@interface SBWallpaperEffectView : UIView {
	NSInteger _startStyle;
	NSInteger _endStyle;
}
@property (assign,nonatomic) NSInteger wallpaperStyle;
@end

%hook SBWallpaperEffectView
-(void)layoutSubviews {
	%orig();

	if ([self.window isKindOfClass:%c(_SBWallpaperWindow )]) {
		self.wallpaperStyle = 0;
		MSHookIvar<NSInteger>(self, "_startStyle") = 0;
		MSHookIvar<NSInteger>(self, "_endStyle") = 0;
	}
}
%end