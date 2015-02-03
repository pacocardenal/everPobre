#import "_PCANotebook.h"
@import Foundation;

@interface PCANotebook : _PCANotebook {}

+(instancetype)notebookWithName:(NSString *)name context:(NSManagedObjectContext*)context;

@end
