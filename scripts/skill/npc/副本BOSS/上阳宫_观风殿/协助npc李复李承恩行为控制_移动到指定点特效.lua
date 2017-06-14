---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/������_�۷��/Э��npc���ж���Ϊ����_�ƶ���ָ������Ч.lua
-- ����ʱ��:	2016/5/12 15:13:54
-- �����û�:	zhangdongen
-- �ű�˵��:
----------------------------------------------------------------------<

--------------�ű��ļ���ʼ------------------------------------------------
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local nX, nY, nZ = player.GetCoordinateSkillTarget()
	local scene = player.GetScene()
	local LiChengEn = scene.GetNpcByNickName("LiChengEn")
	local LiFu = scene.GetNpcByNickName("LiFu")
	local jihuomubiaokongzhi = scene.GetNpcByNickName("jihuomubiaokongzhi")
	if jihuomubiaokongzhi then
		jihuomubiaokongzhi.SetCustomInteger4(16, nX + 1)
		jihuomubiaokongzhi.SetCustomInteger4(20, nY + 1)
		jihuomubiaokongzhi.SetCustomInteger4(24, nZ + 1)
	end
	
	if LiChengEn then
		if LiChengEn.GetCustomBoolean(1) == true then
			--LiChengEn.RunTo(nX, nY)
			LiChengEn.FireAIEvent(2002, 0, 1)
		end
	end

	if LiFu then
		if LiFu.GetCustomBoolean(1) == true then
			--LiFu.RunTo(nX, nY)
			LiFu.FireAIEvent(2002, 0, 1)
		end
	end
end

function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com