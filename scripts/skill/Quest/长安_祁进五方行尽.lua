------------------------------------------------
-- �ļ���    :  ����_����巽�о�.lua
-- ������    :  ����	
-- ����ʱ��  :  2008-12-29
-- ��;(ģ��):  �书����
-- �书����  :  ����
-- �书����  :  �ڹ�
-- �书��·  :  ��ڤ����
-- ��������  :  �巽�о�
-- ����Ч��  :  ǰ�����η�ΧAOE
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{ nDamageBase = 88,  nDamageRand = 44,   nCostMana = 0}, 		--level 1
	
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

    local bRetCode     = false;
	local dwSkillLevel	= skill.dwLevel
	
    skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,				-- ��������ģʽ
   		ATTRIBUTE_TYPE.SKILL_NEUTRAL_DAMAGE,								-- ħ������
   		tSkillData[dwSkillLevel].nDamageBase * 0.14,							-- ����ֵ1
   		0																-- ����ֵ2
   		);
   		
   	skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,				-- ��������ģʽ
   		ATTRIBUTE_TYPE.SKILL_NEUTRAL_DAMAGE_RAND,							-- ħ������
   		tSkillData[dwSkillLevel].nDamageRand * 0.14,							-- ����ֵ1
   		0																-- ����ֵ2
   		);
    
    skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,				-- ��������ģʽ
   		ATTRIBUTE_TYPE.CALL_NEUTRAL_DAMAGE,								-- ħ������
   		0,																-- ����ֵ1
   		0																-- ����ֵ2
   		);
   		
	
    ----------------- ����CoolDown ---------------------------------------------------------------------
    --CoolDownλ(��4��)��SetCoolDown(posi, id)��posiΪCoolDownλ��idΪCoolDown��id��Ҫ��CoolDownList.tab
--    skill.SetCoolDown(1, 16);	--����CD
--    skill.SetCoolDown(2, 169);	-- 15��CD
    
    
    skill.BindBuff(1, 555, 1)
    
	--������λ
	--skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.UPPER
	
	----------------- ���ü������� ---------------------------------------------------------------------
--	skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	
    ----------------- ����������� ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;

    skill.nMinRadius		= 0											--����ʩ����С�뾶
    skill.nMaxRadius        = 8 * LENGTH_BASE;							--����ʩ�����뾶
    skill.nAngleRange       = 64; 										--ʩ�ŽǶ�
    skill.nAreaRadius       = 8 * LENGTH_BASE;							--�������ð뾶
    skill.nTargetCountLimit = 6;
    
    skill.nPrepareFrames    = 0;										--����֡��,16֡����1��
    
 	skill.nBulletVelocity   = 0;										--�ӵ��ٶ�,��/֡
    
    --skill.nBreakRate        = 1024;									--��ϵĸ���,Ĭ��1024��ʾһ�����
   
    return true;
end



--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
    return nPreResult;
end

function OnSkillLevelUp(skill, player)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com