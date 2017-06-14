------------------------------------------------
-- �ļ���    :  ���_�Ӽ���_��_��Ѫս��.lua
-- ������    :  ����	
-- ����ʱ��  :  2008-09-11 16:14	
-- ��;(ģ��):  �书����
-- �书����  :  ���
-- �书����  :  �⹦
-- �书��·  :  ����ǹ��
-- ��������  :  ��
-- ����Ч��  :  �ڰ�Ѫս��6������,30%Ѫ��,ʹ��������ļ���,�ڳɹ�ʩ�����,��ʩ���߻�ѪΪԭ���ĵ�һ��
--                  
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nCostLife = 149,nAddLife = 149/2},			-- Level 1	28    
	{nCostLife = 172,nAddLife = 172/2},         -- Level 2  36    
	{nCostLife = 196,nAddLife = 196/2},         -- Level 3  44    
	{nCostLife = 219,nAddLife = 219/2},         -- Level 4  52    
	{nCostLife = 243,nAddLife = 243/2},         -- Level 5  60    
	{nCostLife = 324,nAddLife = 324/2},         -- Level 6  68    

};


--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	
	local dwSkillLevel	= skill.dwLevel;



	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.THERAPY_POWER_PERCENT,
		-1024,
		0
	);
    	

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_THERAPY,
		tSkillData[dwSkillLevel].nAddLife,
		0
	);
    	


    ----------------- ����CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
    --skill.SetPublicCoolDown(16);		--����CD1��
	
	----------------- ���ü������� ---------------------------------------------------------------------
	skill.nCostMana	=  0;
	
    ----------------- ����������� ----------------------------------------------------------------------
	skill.nSelfLifePercentMin	= 0;			-- Ѫ����Сֵ>=
	skill.nSelfLifePercentMax	= 30;			-- Ѫ�����ֵ<=
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;

    skill.nMinRadius		= 0											--����ʩ����С�뾶
    skill.nMaxRadius        = 4 * LENGTH_BASE;							--����ʩ�����뾶
    skill.nAngleRange       = 128; 										--ʩ�ŽǶ�,ȫ��256
    
    
    skill.nPrepareFrames    = 0;										--����֡��,16֡����1��
    
 	skill.nBulletVelocity   = 0;										--�ӵ��ٶ�,��/֡
    
    skill.nBreakRate        = 1024;									--����ϵĸ���,Ĭ��1024��ʾһ�������
    ----------------- ����Ѫ������ ---------------------------------------------
	skill.nSelfLifePercentMin	= 0;			-- Ѫ����Сֵ>=
	skill.nSelfLifePercentMax	= 30;			-- Ѫ�����ֵ<=
	
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