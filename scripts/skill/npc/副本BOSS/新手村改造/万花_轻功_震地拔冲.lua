------------------------------------------------
-- �ļ���    :  ��_�Ṧ_��ذγ�.lua
-- ������    :  ����
-- ����ʱ��  :  2008-3-7
-- ��;(ģ��):  �书����
-- �书����  :  ��
-- �书����  :  �⹦
-- �书��·  :  ���Ṧ
-- ��������  :  ��ذγ�
-- ����Ч��  :  ���Լ��ĺ󷽿����ƶ�������ʱ����ɷ�Χ�˺�,����������Ծ�е�Ŀ��
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData=
{
	{nSpeed = 60, nCostMana = 125},
	{nSpeed = 60, nCostMana = 226},
	{nSpeed = 60, nCostMana = 314},
	{nSpeed = 60, nCostMana = 401},
	{nSpeed = 60, nCostMana = 488},
	{nSpeed = 60, nCostMana = 576}
};
--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
    local bRetCode     = false;

    	skill.AddAttribute(
        	ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
        	ATTRIBUTE_TYPE.DASH_BACKWARD, 
        	16, 
        	35
    	);
		
	skill.AddAttribute(
        	ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
        	ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST, 
        	497, 						--AOE�˺�����
        	dwSkillLevel
    );
    	
  skill.BindBuff(1, 1104, 1)--����������BUFF

	skill.AddSlowCheckSelfBuff(562, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);		-- ��������Buff--�����£����Ṧ
	    ----------------- ����Cool down ---------------------------------------
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
    skill.SetPublicCoolDown(16);
    skill.SetNormalCoolDown(1, 193);
	
    ----------------- ����������� ----------------------------------------  
	skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- �������ĵ�����
    --�����뾶��Ҳ���ǹ�������Ч����
    skill.nMaxRadius        = 4 * LENGTH_BASE;
    --skill.nAngleRange       = 256; 
	--skill.nAreaRadius	=	8 * LENGTH_BASE;
    --����֡��
    skill.nPrepareFrames    = 0;
    --�ӵ��ٶ�
    skill.nBulletVelocity   = 0;
    --����ϵĸ���
    --skill.nDismountingRate  = 1024;									
    skill.nBreakRate        = 1000;
    --Ӳֱ
    --skill.nStiffFrames		= 16
   
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