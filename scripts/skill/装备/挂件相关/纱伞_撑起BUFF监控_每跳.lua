---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/װ��/�Ҽ����/ɴɡ_����BUFF���_ÿ��.lua
-- ����ʱ��:	2015/7/29 20:06:04
-- �����û�:	zhangyan3
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	--���BUFF��NPC�������
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local scene = player.GetScene()
	
	local doodad_now = scene.GetDoodadByNickName("ShaSan_" .. player.dwID)
	if doodad_now then
		local dwDistance_Fanwei = GetDistanceSq(doodad_now.nX, doodad_now.nY, 0, player.nX, player.nY, 0) ^ 0.5
		if dwDistance_Fanwei > 1 * 64 then
			doodad_now.SetDisappearFrames(1, 0)
		end
	end
	
	-- ����ǲ���װ�˱����Ҽ��������� EQUIPMENT_REPRESENT.WAIST_EXTEND
	if player.dwBackItemIndex ~= 13914 and player.dwBackItemIndex ~= 19196 and player.dwBackItemIndex ~= 19256 then --������ʱ���ж�
		player.DelBuff(9314, 1)
		return
	end
	
	local bFLAG = false
	
	local scene = player.GetScene()
	
	local npcX = scene.GetNpcByNickName("ss_yt150813_" .. player.dwID)
	if npcX then
		bFLAG = true
	end
	
	local buff = player.GetBuff(1575, 14)
	if buff then
		bFLAG = true 
	end
	
	if bFLAG then
		if player.GetDynamicSkillGroup() == 0 then
			player.SetDynamicSkillGroup(201)
		end
	else
		player.DelBuff(9314, 1)
	end
end

function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com