function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	local scene = player.GetScene()
	if not scene then
		return
	end
	
	local qianxianzibaokongzhi = scene.GetNpcByNickName("qianxianzibaokongzhi")
	if qianxianzibaokongzhi then
		if scene.dwMapID == 175 then
			qianxianzibaokongzhi.CastSkill(8175, 1, TARGET.PLAYER, dwCharacterID)
		elseif scene.dwMapID == 176 then
			qianxianzibaokongzhi.CastSkill(8175, 2, TARGET.PLAYER, dwCharacterID)
		end
	end
	player.PlaySfx(133, player.nX, player.nY, player.nZ, 0)
	player.PlaySfx(134, player.nX, player.nY, player.nZ, 0)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com