function Apply(dwCharacterID)
	RemoteCallToClient(dwCharacterID, "OnSetViewRespond")
	--else						--��3D�ϰ����ɴ����Ŀ��λ��
	--cPlayer.Stop()
	--cPlayer.TurnTo(cNpc.nFaceDirection) 
	--cPlayer.SetPosition(cNpc.nX, cNpc.nY, cNpc.nZ)
	--cPlayer.TurnTo(cNpc.nFaceDirection) 
	--end
end
function UnApply(dwCharacterID)
	RemoteCallToClient(dwCharacterID, "OnSetViewRespond")
	--else						--��3D�ϰ����ɴ����Ŀ��λ��
	--cPlayer.Stop()
	--cPlayer.TurnTo(cNpc.nFaceDirection) 
	--cPlayer.SetPosition(cNpc.nX, cNpc.nY, cNpc.nZ)
	--cPlayer.TurnTo(cNpc.nFaceDirection) 
	--end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com