function Apply(dwCharacterID)

    local npcA = GetNpc(dwCharacterID)
    		if npcA then
        		local scene = npcA.GetScene()
						local npcB = scene.GetNpcByNickName("YaLuo")
						if npcB then
						npcB.AddBuff(0,99,2173,1)
						end
						npcA.Die()
         end
		
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com