function Apply(dwCharacterID)
end

function UnApply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if npc then   
		npc.SetDisappearFrames(8)
	end
	
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com