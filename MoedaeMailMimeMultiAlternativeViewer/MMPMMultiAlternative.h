//
//  MMPMMultiAlternative.h
//  MoedaeMailMimeMultiAlternativeViewer
//
//  Created by Taun Chapman on 02/08/14.
//  Copyright (c) 2014 MOEDAE LLC. All rights reserved.
//

#import <MoedaeMailPlugins/MoedaeMailPlugins.h>


/*!
 Freed & Borenstein          Standards Track                    [Page 23]RFC 2046                      Media Types                  November 1996
 
 RFC 2046
 
 5.1.4.  Alternative Subtype
 
     The "multipart/alternative" type is syntactically identical to
     "multipart/mixed", but the semantics are different.  In particular,
     each of the body parts is an "alternative" version of the same
     information.
     
     Systems should recognize that the content of the various parts are
     interchangeable.  Systems should choose the "best" type based on the
     local environment and references, in some cases even through user
     interaction.  As with "multipart/mixed", the order of body parts is
     significant.  In this case, the alternatives appear in an order of
     increasing faithfulness to the original content.  In general, the
     best choice is the LAST part of a type supported by the recipient
     system’s local environment.

 */
@interface MMPMMultiAlternative : MMPBaseMimeView

@end
