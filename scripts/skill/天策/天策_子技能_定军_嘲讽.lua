------------------------------------------------
-- �ļ���    :  ���_�Ӽ���_����_����.lua
-- ������    :  ����	
-- ����ʱ��  :  2008-02-26 16:14	
-- ��;(ģ��):  �书����
-- �书����  :  ���
-- �书����  :  �⹦
-- �书��·  :  ����ǹ��
-- ��������  :  ����
-- ����Ч��  :  ʹ��ǹ֮����������ǹӰ���ֶ��֣������޷�����ֻ��Ӧս��ͬʱ��һ���˺�����ޡ�
--                   ����������ǿ�Ƴ��Ŀ�꣩
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--���ӳ���ݶ��ͼ����˺����
tSkillData =
{                                                                                                             
	{nDebuffLevel = 1,nDamage = 31*0.95, nDamageRand = 31*0.1, nThreat = 31},		-- Level 1            
	{nDebuffLevel = 1,nDamage = 43*0.95, nDamageRand = 43*0.1, nThreat = 43},		-- Level 2            
	{nDebuffLevel = 1,nDamage = 56*0.95, nDamageRand = 56*0.1, nThreat = 56},		-- Level 3            
	{nDebuffLevel = 1,nDamage = 69*0.95, nDamageRand = 69*0.1, nThreat = 69},	    -- Level 4            
	{nDebuffLevel = 1,nDamage = 81*0.95, nDamageRand = 81*0.1, nThreat = 81},     -- Level 5            
	{nDebuffLevel = 1,nDamage = 94*0.95, nDamageRand = 94*0.1, nThreat = 94},     -- Level 6            
};                                                                                                            


--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	
	local dwSkillLevel	= skill.dwLevel;
	
	skill.BindBuff(1, 512, 1);
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
		tSkillData[dwSkillLevel].nDamage, 
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand, 
		0
	);
    
--	skill.AddAttribute(
--		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
--		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
--		0, 
--		0
--	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
		ATTRIBUTE_TYPE.SPOOF,
		0,
		0
	);		        					   
    
    
    ----------------- ����CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
--	skill.SetPublicCoolDown(16);		--����CD1��
--	skill.SetNormalCoolDown(2, 93);
	
	----------------- ���ü������� ---------------------------------------------------------------------
	skill.nCostMana	= 0;
	
	 ----------------- ʱ����� -------------------------------------------------
    --skill.nPrepareFrames  	= 0;				-- ����֡��
    --skill.nChannelInterval	= 15; 				-- ͨ�������ʱ�� 
    --skill.nChannelFrame		= 48;	 			-- ͨ��������ʱ�䣬��λ֡�� 
    --skill.nBulletVelocity		= 0;				-- �ӵ��ٶȣ���λ ��/֡
    
        ----------------- ������ -------------------------------------------------
    --skill.nBrokenRate      = 0 * PERCENT_BASE;	-- ���ܱ���ϵĸ���.����1024
    --skill.nBreakRate		= 0;					-- ���Ŀ��ʩ���ĸ���,����1024
    
    ----------------- ����������� ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;
	
	skill.nWeaponDamagePercent	= 0;
	
    skill.nMinRadius		= 0											--����ʩ����С�뾶
    skill.nMaxRadius        = 4 * LENGTH_BASE;							--����ʩ�����뾶
    skill.nAngleRange       = 128; 										--ʩ�ŽǶ�,ȫ��256
    
    skill.nPrepareFrames    = 0;										--����֡��,16֡����1��
    
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