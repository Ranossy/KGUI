---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/������_�۷��/�»�_���Ķ���ʾ3.lua
-- ����ʱ��:	2016/9/30 15:58:21
-- �����û�:	ZHANGGUANYI
-- �ű�˵��:
----------------------------------------------------------------------<
-- ��һ���������õ�ʱ�򴥷�, ����Ϊ���õĶ���ID
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	local scene = player.GetScene()
	if scene then
		if scene.dwMapID == 240 or scene.dwMapID == 250 then
			if player and player.nMoveState ~= MOVE_STATE.ON_DEATH then
				local scene = player.GetScene()
				local yuehua = scene.GetNpcByNickName("yuehua")
				if yuehua and yuehua.bFightState == true then
					player.AddBuff(yuehua.dwID, yuehua.nLevel, 10843, 1)
					player.AddBuff(yuehua.dwID, yuehua.nLevel, 10771, 1)
				end
				--print(12321)
				--player.CastSkill(15984, 1)
			end
		end
		if scene.dwMapID == 248 then
			--if scene.dwMapID == 240 then
			if player and player.nMoveState ~= MOVE_STATE.ON_DEATH then
				local scene = player.GetScene()
				local yuehua = scene.GetNpcByNickName("yuehua")
				if yuehua and yuehua.bFightState == true then
					player.AddBuff(yuehua.dwID, yuehua.nLevel, 10843, 2)
					player.AddBuff(yuehua.dwID, yuehua.nLevel, 10771, 2)
				end
				--print(12321)
				--player.CastSkill(15984, 1)
				--	end
			end
		end
	end
end

-- ��һ�����ܷ�Ӧ�õ�ʱ�򴥷�(��BUFF��ʧ), ����Ϊ���õĶ���ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com