------------------------------------------------
-- �ļ���    :  ����_��צ��_����ʽ.lua
-- ������    :  �º���	
-- ����ʱ��  :  2008-07-18	
-- ��;(ģ��):  �书����
-- �书����  :  ����
-- �书����  :  �⹦
-- �书��·  :  ��צ��
-- ��������  :  ����ʽ
-- ����Ч��  :  �Ե���Ŀ����������ڹ��˺�����ʹ�����50%������12��
--                   
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--���ӳ���ݶ��ͼ����˺����
tSkillData =
{
	{ nDamage = 0, nDamageRand = 0, nCostMana = 33 },		-- Level 1
	{ nDamage = 0, nDamageRand = 0, nCostMana = 57 },		-- Level 2
	{ nDamage = 0, nDamageRand = 0, nCostMana = 77 },		-- Level 3
	{ nDamage = 0, nDamageRand = 0, nCostMana = 98 },	-- Level 4
	{ nDamage = 0, nDamageRand = 0, nCostMana = 118},		-- Level 1
	{ nDamage = 0, nDamageRand = 0, nCostMana = 135},		-- Level 2

};


--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	
	local dwSkillLevel	= 5;
	

--	skill.AddAttribute(
--		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
--		ATTRIBUTE_TYPE.SKILL_SOLAR_DAMAGE,
--		tSkillData[dwSkillLevel].nDamage, 
--		0
--	);
--
--	skill.AddAttribute(
--		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
--		ATTRIBUTE_TYPE.SKILL_SOLAR_DAMAGE_RAND,
--		tSkillData[dwSkillLevel].nDamageRand, 
--		0
--	);
--    
--	skill.AddAttribute(
--		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
--		ATTRIBUTE_TYPE.CALL_SOLAR_DAMAGE,
--		0, 
--		0
--	);

    skill.BindBuff(1, 563, dwSkillLevel);
    ----------------- ����CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
--	skill.SetPublicCoolDown(16);		--����CD1��
	skill.SetNormalCoolDown(1, 48);
	skill.SetCheckCoolDown(1, 444);
	----------------- ���ü������� ---------------------------------------------------------------------
   	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	skill.nCostManaBasePercent = 93;	-- �������ĵ�����
	----------------- ʱ����� -------------------------------------------------
    --skill.nPrepareFrames  	= 0;				-- ����֡��
    --skill.nChannelInterval	= 15; 				-- ͨ�������ʱ�� 
    --skill.nChannelInterval		= 48;	 			-- ͨ��������ʱ�䣬��λ֡�� 
    --skill.nBulletVelocity		= 0;				-- �ӵ��ٶȣ���λ ��/֡
    
        ----------------- ������ -------------------------------------------------
    --skill.nBrokenRate      = 0 * PERCENT_BASE;	-- ���ܱ���ϵĸ���.����1024
    --skill.nBreakRate		= 0;					-- ���Ŀ��ʩ���ĸ���,����1024
    
    ----------------- ����������� ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;
	
	
    skill.nMinRadius		= 0											--����ʩ����С�뾶
    skill.nMaxRadius        = 8* LENGTH_BASE;							--����ʩ�����뾶
    skill.nAngleRange       = 128; 										--ʩ�ŽǶ�,ȫ��256
    skill.nPrepareFrames    = 0;										--����֡��,16֡����1��
    skill.nWeaponDamagePercent		= 0;
 	skill.nBulletVelocity   = 0;										--�ӵ��ٶ�,��/֡
    
    skill.nBreakRate        = 0;									--����ϵĸ���,Ĭ��1024��ʾһ�������
   
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