------------------------------------------------
-- �ļ���    :  �������ľ���Ů洲��졷��żͼ��ҳ.lua
-- ������    :  zhengkaifeng
-- ����ʱ��  :  2011-05-08
-- ��;(ģ��):  �书����
-- �书����  :  �嶾
-- �书����  :  ����
-- �书��·  :  
-- ��������  :  
-- ����Ч��  :  ��ʽ�����ƶ��ٶ�Ч������5%
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
	


	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
		ATTRIBUTE_TYPE.CALL_BUFF,
		3414,
		1
	);
	skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,			
   		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,								
   		"skill/�嶾/����/23��ļ����ؼ�1.lua",				
   		0														
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