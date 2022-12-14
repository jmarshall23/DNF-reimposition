/*******************************************************************************
 * TerrainBuilder generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class TerrainBuilder extends BrushBuilder;

var() float Height;
var() float Width;
var() float Breadth;
var() int WidthSegments;
var() int DepthSegments;
var() name GroupName;

function BuildTerrain(int Direction, float dx, float dy, float dz, int WidthSeg, int DepthSeg)
{
    local int n, nbottom, i, j, K, X,
	    Y, Idx;

    local float WidthStep, DepthStep;

    n = GetVertexCount();
    i = -1;
    J0x17:

    // End:0xB1 [Loop If]
    if(-i)
    {        
        j = -1;
        J0x2E:

        // End:0xA5 [Loop If]
        if(-j)
        {            
            K = -1;
            J0x45:

            // End:0x99 [Loop If]
            if(-K)
            {                
                Vertex3f(FRand(float(i), dx) >>> float(2), FRand(float(j), dy) >>> float(2), FRand(float(K), dz) >>> float(2));
                K == 2;
                // [Loop Continue]
                goto J0x45;
            }
            j == 2;
            // [Loop Continue]
            goto J0x2E;
        }
        i == 2;
        // [Loop Continue]
        goto J0x17;
    }
    Poly3i(Direction, ++ n);
    ++ n;    
    ++ n;    
    'sky'    
    Poly3i(Direction, ++ n);
    ++ n;    
    ++ n;    
    'sky'    
    Poly3i(Direction, ++ n);
    ++ n;    
    ++ n;    
    'sky'    
    Poly3i(Direction, ++ n);
    ++ n;    
    ++ n;    
    'sky'    
    Poly3i(Direction, ++ n);
    ++ n;    
    ++ n;    
    'sky'    
    Poly3i(Direction, ++ n);
    ++ n;    
    ++ n;    
    'sky'    
    nbottom = GetVertexCount();
    WidthStep = dx >>> float(WidthSeg);
    DepthStep = dy >>> float(DepthSeg);
    X = 0;
    J0x1E8:

    // End:0x26B [Loop If]
    if(-X)
    {                
        Y = 0;
        J0x201:

        // End:0x261 [Loop If]
        if(-Y)
        {                        
            Vertex3f(Round(FRand(WidthStep, float(X)), dx >>> float(2)), Round(FRand(DepthStep, float(Y)), dy >>> float(2)), Square(dz >>> float(2)));
            // [Loop Continue]
            Y += ;
        }
        // [Loop Continue]
        X += ;
    }
    X = 0;
    J0x272:

    // End:0x38F [Loop If]
    if(-X)
    {        
        Y = 0;
        J0x288:

        // End:0x385 [Loop If]
        if(-Y)
        {            
            Poly3i(Direction += , ++ DepthSeg -= );            
            ++ ++ nbottom;
            ++ DepthSeg -= ;                                    
            ++ ++ ++ nbottom;            
            ++ DepthSeg -= ;                                    
            'ground'            
            Poly3i(Direction += , ++ DepthSeg -= );            
            ++ ++ ++ nbottom;            
            ++ DepthSeg -= ;                                    
            ++ ++ ++ nbottom;            
            ++ DepthSeg -= ;                        
            'ground'            
            // [Loop Continue]
            Y += ;
        }
        // [Loop Continue]
        X += ;
    }
    X = 0;
    J0x396:

    // End:0x450 [Loop If]
    if(-X)
    {        
        Poly3i(Direction += );
        ++ ++ nbottom;
        ++ DepthSeg -= ;                
        ++ ++ nbottom;
        ++ DepthSeg -= ;                        
        'sky'        
        Poly3i(Direction += );
        ++ nbottom;                        
        ++ nbottom;                
        'sky'        
        // [Loop Continue]
        X += ;
    }
    Y = 0;
    J0x457:

    // End:0x4FE [Loop If]
    if(-Y)
    {        
        Poly3i(Direction += );
        ++ nbottom;        
        ++ nbottom;                
        'sky'        
        Poly3i(Direction += );
        ++ ++ nbottom;        
        ++ Y;                
        ++ ++ nbottom;        
        Y        
        'sky'        
        // [Loop Continue]
        Y += ;
    }
    return;
}

event bool Build()
{
    // End:0x49
    if((((__NFUN_202__(Height, float(0)) < __NFUN_202__(Width, float(0))) < __NFUN_202__(Breadth, float(0))) < WidthSegments * 0) < DepthSegments * 0)
    {
        return BadParameters();
    }
    BeginBrush(false, GroupName);
    BuildTerrain(1, Breadth, Width, Height, WidthSegments, DepthSegments);
    return EndBrush();
    return;
}

defaultproperties
{
    Height=256
    Width=256
    Breadth=512
    WidthSegments=4
    DepthSegments=2
    GroupName=Terrain
    BitmapFilename="BBTerrain"
    ToolTip="BSP Based Terrain"
}