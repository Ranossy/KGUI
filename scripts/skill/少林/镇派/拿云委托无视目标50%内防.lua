------------------------------------------------
-- ������    :  CBG
-- ����ʱ��  :  2011-04-02
-- ��;(ģ��):  �书����
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
	local nRecipeLevel = SkillRecipeLevel;
	if skill.dwSkillID == 3833  or skill.dwSkillID == 3842 or skill.dwSkillID == 3845 or skill.dwSkillID == 3836 or
		skill.dwSkillID == 3843 or skill.dwSkillID == 3846 or skill.dwSkillID == 3839 or skill.dwSkillID == 3844 or
		skill.dwSkillID == 3847 or skill.dwSkillID == 13681 or skill.dwSkillID == 13682 or skill.dwSkillID == 13683 or
		skill.dwSkillID == 13684 or skill.dwSkillID == 13685 or skill.dwSkillID == 13686 or skill.dwSkillID == 3848 or
		skill.dwSkillID ==3849 or skill.dwSkillID ==3850 then
	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_AND_ROLLBACK, 
        ATTRIBUTE_TYPE.SOLAR_MAGIC_SHIELD_PERCENT,
        -512, 
        0
		);
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