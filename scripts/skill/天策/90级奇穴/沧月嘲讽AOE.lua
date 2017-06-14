---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���/90����Ѩ/���³���AOE.lua
-- ����ʱ��:	2013/4/17 21:11:03
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ���_����_�Ӽ���_Ⱥ�����.lua
-- ������    :  ����	
-- ����ʱ��  :  2008-02-26 16:14	
-- ��;(ģ��):  �书����
-- �书����  :  ���
-- �书����  :  �⹦
-- �书��·  :  ����ǹ��
-- ��������  :  ����
-- ����Ч��  :  Ⱥ�����,����ǰĿ����.
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--���ӳ���ݶ��ͼ����˺����
tSkillData = 
{
	{nCostMana = 49, nTime = 20, nDamage = 43 * 0.95, nDamageRand = 43 * 0.1 }, -- Level 1
	{nCostMana = 62, nTime = 20, nDamage = 78 * 0.95, nDamageRand = 78 * 0.1 }, -- Level 1
	{nCostMana = 76, nTime = 20, nDamage = 109 * 0.95, nDamageRand = 109 * 0.1 }, -- Level 1
	{nCostMana = 90, nTime = 20, nDamage = 141 * 0.95, nDamageRand = 141 * 0.1 }, -- Level 1
	
};


--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	
	local dwSkillLevel = skill.dwLevel;
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.SPOOF,
		0,
		0
	);	

	skill.BindBuff(1, 5645, 1);	-- ����95%Buff
	
	
		   
    
	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
--	skill.SetPublicCoolDown(16);		--����CD1��
--	skill.SetNormalCoolDown(2, 93);
	
	----------------- ���ü������� ---------------------------------------------------------------------
	skill.nCostMana = 0;
	
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
	
	skill.nWeaponDamagePercent = 0;
	
	skill.nMinRadius = 0											--����ʩ����С�뾶
	skill.nMaxRadius = 6 * LENGTH_BASE;							--����ʩ�����뾶
	skill.nAngleRange = 256; 										--ʩ�ŽǶ�,ȫ��256
	skill.nAreaRadius = 6 * LENGTH_BASE;
	skill.nPrepareFrames = 0;										--����֡��,16֡����1��
    
	skill.nBulletVelocity = 30;										--�ӵ��ٶ�,��/֡
	skill.nDismountingRate = 1024;									--������Ϊ100% 
	skill.nBreakRate = 0;									--����ϵĸ���,Ĭ��1024��ʾһ�������
	skill.nTargetCountLimit = 6;
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