------------------------------------------------
-- �ļ���    :  Τ�����Ƶ���.lua
-- ������    :  CBG
-- ����ʱ��  :  2011-04-02
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
    local nWeituoID = skill.dwSkillID

	skill.AddAttribute(
	        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
	        ATTRIBUTE_TYPE.ADD_DAMAGE_BY_DST_MOVE_STATE,
	        1049088, 
	        512
	    );
	skill.AddAttribute(
	        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
	        ATTRIBUTE_TYPE.ADD_DAMAGE_BY_DST_MOVE_STATE,
	        4096, 
	        307
	    );
	
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