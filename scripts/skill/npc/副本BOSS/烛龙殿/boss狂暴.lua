function Apply(dwCharacterID)
	local tnpc = GetNpc(dwCharacterID)
	if not tnpc then
		return
	end
	local scene = tnpc.GetScene()
	local npcBOSS = scene.GetNpcByNickName("fuwangboss")
	if tnpc.dwTemplateID == 56830 then
		local liuluanqijieduankongzhi = scene.GetNpcByNickName("liuluanqijieduankongzhi")
		if liuluanqijieduankongzhi and liuluanqijieduankongzhi.GetCustomInteger1(1) == 3 then
			tnpc.Say(GetEditorString(11, 6462))
		end
	end
	tnpc.AddBuff(0,99,3819,1,1)
	if not npcBOSS then
		return	
	end
    npcBOSS.AddBuff(0,99,3819,1,1)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com