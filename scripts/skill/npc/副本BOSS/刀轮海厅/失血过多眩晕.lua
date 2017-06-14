---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/���ֺ���/ʧѪ����ѣ��.lua
-- ����ʱ��:	2017/4/24 15:21:51
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
	if not scene then
		return
	end
	local npc = scene.GetNpcByNickName("liuguanjiao")
	if not npc then
		return
	end
	local nRan = Random(10000)
	if nRan <= 3000 then
		if npc then
			player.AddBuff(npc.dwID, npc.nLevel, 11719, 1)
		end
	end
end

-- ��һ�����ܷ�Ӧ�õ�ʱ�򴥷�(��BUFF��ʧ), ����Ϊ���õĶ���ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com