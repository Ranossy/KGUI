function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if npc then
		local scene = npc.GetScene()
		if scene then
		scene.CreateNpc(10795,npc.nX,npc.nY,npc.nZ,0,2560);   
		end
	end
end
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com