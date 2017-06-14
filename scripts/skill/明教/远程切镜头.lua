function Apply(dwCharacterID)
	RemoteCallToClient(dwCharacterID, "OnSetViewRespond")
	--else						--若3D障碍不可达，则传至目标位置
	--cPlayer.Stop()
	--cPlayer.TurnTo(cNpc.nFaceDirection) 
	--cPlayer.SetPosition(cNpc.nX, cNpc.nY, cNpc.nZ)
	--cPlayer.TurnTo(cNpc.nFaceDirection) 
	--end
end
function UnApply(dwCharacterID)
	RemoteCallToClient(dwCharacterID, "OnSetViewRespond")
	--else						--若3D障碍不可达，则传至目标位置
	--cPlayer.Stop()
	--cPlayer.TurnTo(cNpc.nFaceDirection) 
	--cPlayer.SetPosition(cNpc.nX, cNpc.nY, cNpc.nZ)
	--cPlayer.TurnTo(cNpc.nFaceDirection) 
	--end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com