------------------------------------------------
-- �ļ���    :  ��_�����¼�_ˮ���޼�.lua
-- ������    :  kingbeyond	
-- ����ʱ��  :  2007-09-05 19:17
-- ��;(ģ��):  �书����
-- �书����  :  ��
-- �书����  :  �⹦
-- �书��·  :  �����¼�
-- ��������  : 	ˮ���޼�
-- ����Ч��  :  ʹ�ü��ܺ��ܵ��˺�����ħ

-- �õ�debuff54��

------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
     {nDamage = 20},
     {nDamage = 20},
     {nDamage = 20},
     {nDamage = 20},
     {nDamage = 20},
};


--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	local nSkillLevel = skill.dwLevel
	
	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.CALL_NEUTRAL_DAMAGE,
        tSkillData[nSkillLevel].nDamage,
        0
    );
	
	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.CALL_BUFF,
        449,
        1
    );
	
    ----------------- ����CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
    --skill.SetNormalCoolDown(1, 8);
	
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana			= tSkillData[nSkillLevel].nCostMana;
	
    ----------------- ����������� ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������

    --skill.nMinRadius		= 0											--����ʩ����С�뾶
    skill.nMaxRadius        = 20 * LENGTH_BASE;							--����ʩ�����뾶
    skill.nAngleRange       = 256; 										--ʩ�ŽǶ�Ϊ360��
    --skill.nAreaRadius		= 15 * LENGTH_BASE
    
    
    --skill.nPrepareFrames    = 32;										--����֡��,16֡����1��
    
 	--skill.nBulletVelocity   = 12;										--�ӵ��ٶ�,��/֡
    
    --skill.nBreakRate        = 1024;									--����ϵĸ���,Ĭ��1024��ʾһ�������
   
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