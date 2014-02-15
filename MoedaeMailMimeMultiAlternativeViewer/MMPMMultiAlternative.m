//
//  MMPMMultiAlternative.m
//  MoedaeMailMimeMultiAlternativeViewer
//
//  Created by Taun Chapman on 02/08/14.
//  Copyright (c) 2014 MOEDAE LLC. All rights reserved.
//

#import "MMPMMultiAlternative.h"

@implementation MMPMMultiAlternative

+(NSSet*) contentTypes {
    return [NSSet setWithObjects:@"MULTIPART/ALTERNATIVE", nil];
}

-(void) createSubviews {
    NSOrderedSet* subNodes = self.node.childNodes;
    
    MMPMimeProxy* plainText;
    MMPMimeProxy* richNode; // can be html or enriched
    
    for (MMPMimeProxy* node in subNodes) {
        // should only be two nodes, use an assert?
        // could also just check the first node
        // rather than depend on the order of childnodes, let's find the plain text alternative.
        if ([node.type isEqualToString:@"TEXT"] && [node.subtype isEqualToString: @"PLAIN"]) {
            plainText = node;
        } else {
            richNode = node;
        }
    }
    
    MMPMimeProxy* node = [self wantsRichTextPresentation] ? richNode : plainText;
    
    Class nodeViewClass = [[MBMimeViewerPluginsManager manager] classForMimeType: node.type subtype: node.subtype];
    
    NSSize subStructureSize = self.frame.size;
    NSRect nodeRect = NSMakeRect(0, 0, subStructureSize.width, subStructureSize.height);
    MMPBaseMimeView* nodeView = [[nodeViewClass alloc] initWithFrame: nodeRect node: node options: self.options attributes: self.attributes];
    
    self.mimeView = nodeView;
//    [self addSubview: self.mimeView];
    
//    [self.mimeView setTranslatesAutoresizingMaskIntoConstraints: NO];
    
    [super createSubviews];
}

@end
