------------------------------------------------
-- �ļ���    :  
-- ������    :  zhx
-- ����ʱ��  :  20120924
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillRecipeData =
{	
};


--�����书���ܼ��������ֵ
function GetSkillRecipeData(skill, SkillRecipeID, SkillRecipeLevel)

    local bRetCode     	= false;
    local nRecipeLevel	= SkillRecipeLevel;

	if skill.dwSkillID == 4483 or  skill.dwSkillID == 4484 or  skill.dwSkillID == 4485 or  skill.dwSkillID == 4486 or  skill.dwSkillID == 4487 or  skill.dwSkillID == 4488 or  skill.dwSkillID == 4489 or  skill.dwSkillID == 4490 then	--�����9��
		skill.nBaseThreat = 347 + skill.dwLevel  * 330;
	end
	
	if skill.dwSkillID == 4476 then	---�����9��
		skill.nBaseThreat = 116 + skill.dwLevel  * 110;	
	end
		
    return true;
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