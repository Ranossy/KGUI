------------------------------------------------
-- �ļ���    :  ��ǧ�����֡����㡷�洫��ҳ.lua
-- ������    :  zhengkaifeng
-- ����ʱ��  :  2011-05-08
-- ��;(ģ��):  �书����
-- �书����  :  �嶾
-- �书����  :  ����
-- �书��·  :  
-- ��������  :  
-- ����Ч��  :  ����AOE����
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
	
	if SkillRecipeID == 771 then			-- ��ҳ
		skill.nAreaRadius = skill.nAreaRadius + 64
	elseif SkillRecipeID == 772 then		-- ��ƪ
		skill.nAreaRadius = skill.nAreaRadius + 128
	elseif SkillRecipeID == 773 then		-- ����
		skill.nAreaRadius = skill.nAreaRadius + 64
	end

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