---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/������_�۷��/�»�_���Ķ���ʾ1.lua
-- ����ʱ��:	2016/9/22 17:22:18
-- �����û�:	ZHANGGUANYI
-- �ű�˵��:
----------------------------------------------------------------------<
-- ��һ���������õ�ʱ�򴥷�, ����Ϊ���õĶ���ID
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player and player.nMoveState ~= MOVE_STATE.ON_DEATH then
		local scene = player.GetScene()
		local yuehua = scene.GetNpcByNickName("yuehua")
		if yuehua and yuehua.bFightState == true then
			player.AddBuff(yuehua.dwID, yuehua.nLevel, 11292, 1)
		end
		--print(12321)
		--player.CastSkill(15984, 1)
	end
end

-- ��һ�����ܷ�Ӧ�õ�ʱ�򴥷�(��BUFF��ʧ), ����Ϊ���õĶ���ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com