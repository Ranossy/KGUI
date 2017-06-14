---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/���ֺ���/������֢.lua
-- ����ʱ��:	2017/4/2 0:53:30
-- �����û�:	CHENGSIHAN
-- �ű�˵��:
----------------------------------------------------------------------<

-- ��һ���������õ�ʱ�򴥷�, ����Ϊ���õĶ���ID
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local scene = player.GetScene()
	local linghushang = scene.GetNpcByNickName("linghushang")
	local Nbuff = player.GetBuff(11853, 1)
	local Num = Nbuff.nStackNum
	if linghushang and player and player.bFightState then
		player.DelGroupBuff(11853, 1)
		for i = 1, Num do
			player.AddBuff(player.dwID, player.nLevel, 11849, 1)
		end
	end
end

-- ��һ�����ܷ�Ӧ�õ�ʱ�򴥷�(��BUFF��ʧ), ����Ϊ���õĶ���ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com