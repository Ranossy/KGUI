---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/Default.lua
-- ����ʱ��:	2013/9/9 16:05:17
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- ������   :  ����	
-- ����ʱ��	:  2007-12-11
-- Ч����ע	:  Ĭ�ϵļ��ܽű�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillRecipeData = 
{
	{nThreat = 259    }, -- Level 1
	{nThreat = 389    }, -- Level 2
	{nThreat = 518    }, -- Level 3
	{nThreat = 648    }, -- Level 4
	{nThreat = 259    }, -- Level 1
	{nThreat = 389    }, -- Level 2
	{nThreat = 518    }, -- Level 3
	{nThreat = 648    }, -- Level 4
	{nThreat = 259    }, -- Level 1
	{nThreat = 389    }, -- Level 2
	{nThreat = 518    }, -- Level 3
	{nThreat = 648    }, -- Level 4
	{nThreat = 259    }, -- Level 1
	{nThreat = 389    }, -- Level 2
	{nThreat = 518    }, -- Level 3
	{nThreat = 648    }, -- Level 4
	{nThreat = 259    }, -- Level 1
	{nThreat = 389    }, -- Level 2
	{nThreat = 518    }, -- Level 3
	{nThreat = 648    }, -- Level 4
	{nThreat = 778    }, -- Level 5
	{nThreat = 907    }, -- Level 6
	{nThreat = 1037   }, -- Level 7
	{nThreat = 1166   }, -- Level 8
	{nThreat = 1296   }, -- Level 9
	{nThreat = 1426   }, -- Level 10
	{nThreat = 1705   }, -- Level 11	
	{nThreat = 1705   }, -- Level 12	
};

--�����书���ܼ��������ֵ
function GetSkillRecipeData(skill, SkillRecipeID, SkillRecipeLevel)

	local bRetCode = false;
	local nRecipeLevel = SkillRecipeLevel;
	local dwSkillLevel = skill.dwLevel

	skill.nBaseThreat = skill.dwLevel * 200;

	return
end



--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
	return nPreResult;
end


function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com