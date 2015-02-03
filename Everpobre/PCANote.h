#import "_PCANote.h"
#import "Foundation/Foundation.h"

@interface PCANote : _PCANote {}
// Custom logic goes here.

+(instancetype) noteWithName:(NSString *)name
                    notebook:(PCANotebook *)notebook
                     context:(NSManagedObjectContext *)context;

@end
