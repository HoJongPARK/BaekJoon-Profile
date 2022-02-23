//
//  ProfileView.swift
//  BaekJoonProfile
//
//  Created by 박종호 on 2022/02/15.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProfileHost: View {
    let profile : Profile
    let logout:()->()
    
    var body: some View {
        
        GeometryReader { geo in
            
            VStack(alignment:.center){
                
                ScrollView(.vertical, showsIndicators: false){
                    BackgroundView(url: profile.backgroundImage ,width: geo.size.width)
                    
                    ProfileImage(url : profile.profileImage , tier: profile.tier ,width: geo.size.width/3)
                        .offset(y:-70)
                        .padding(.bottom,-56)
                    
                    Text(profile.handle)
                        .bodyText(textColor: .white)
                    
                    ProfileDescription(text: profile.selfDescription)
                    
                    ClassBadgeStreakView(width: geo.size.width-32, profile: profile)
                        .padding(8)
                    
                    VerticalInfoView(solved: profile.solvedCount, rating: profile.rating, rank: profile.rank ,width: geo.size.width-32, textColor: Profile.getTierColor(tier: profile.tier))
                }
                BottomButton {
                    logout()
                }
            }
            
        }
        .frame(maxWidth:.infinity,maxHeight: .infinity)
        .background(Color.backgroundColor.edgesIgnoringSafeArea(.all))
        .edgesIgnoringSafeArea(.top)
        .preferredColorScheme(.dark)
        
    }
}



struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        let profile = Profile.provideDummyData()
        Group {
            ForEach(PreviewDevice.previewDevices, id: \.self) { previewDevice in
                ProfileHost(profile: profile){}
                .previewDevice(PreviewDevice(rawValue: previewDevice))
                .previewDisplayName(previewDevice)
                
            }
        }
    }
}

