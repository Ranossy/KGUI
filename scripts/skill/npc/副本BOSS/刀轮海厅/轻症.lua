---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/���ֺ���/��֢.lua
-- ����ʱ��:	2017/4/2 0:52:05
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
	local nRan = Random(10000)
	if nRan <= 8000 then
		if player.nCurrentLife > 0 then
			if player.nCurrentLife >= player.nMaxLife * 0.3 then
				player.nCurrentLife = player.nCurrentLife - player.nMaxLife * 0.3
			else	
			player.nCurrentLife = 0
			end
		end
	end
end

-- ��һ�����ܷ�Ӧ�õ�ʱ�򴥷�(��BUFF��ʧ), ����Ϊ���õĶ���ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com