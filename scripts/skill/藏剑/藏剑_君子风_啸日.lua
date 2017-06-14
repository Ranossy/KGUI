---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/�ؽ�/�ؽ�_���ӷ�_Х��.lua
-- ����ʱ��:	2013/6/6 23:57:22
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  �ؽ�_���ӷ�_Х��.lua
-- ������    :  zhangqi	
-- ����ʱ��  :  2010-03-2
-- ��;(ģ��):  �书����
-- �书����  :  �ؽ�
-- �书����  :  �⹦
-- �书��·  :  ���ӷ�
-- ��������  :  Х��
-- ����Ч��  :  ���绽�꣬Х�վ��졣
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nAddRage = 0, nCostRage = 0, nDamage = 14 * 0.95, nDamageRand = 14 * 0.1}, -- Level 1 
	{nAddRage = 0, nCostRage = 0, nDamage = 23 * 0.95, nDamageRand = 23 * 0.1}, -- Level 2 
	{nAddRage = 0, nCostRage = 0, nDamage = 31 * 0.95, nDamageRand = 31 * 0.1}, -- Level 3 
	{nAddRage = 0, nCostRage = 0, nDamage = 39 * 0.95, nDamageRand = 39 * 0.1}, -- Level 4 
	{nAddRage = 0, nCostRage = 0, nDamage = 47 * 0.95, nDamageRand = 47 * 0.1}, -- Level 5 
	{nAddRage = 0, nCostRage = 0, nDamage = 54 * 0.95, nDamageRand = 54 * 0.1}, -- Level 6 
	{nAddRage = 0, nCostRage = 0, nDamage = 62 * 0.95, nDamageRand = 62 * 0.1}, -- Level 7 
	{nAddRage = 0, nCostRage = 0, nDamage = 70 * 0.95, nDamageRand = 70 * 0.1}, -- Level 8 
	{nAddRage = 0, nCostRage = 0, nDamage = 78 * 0.95, nDamageRand = 78 * 0.1}, -- Level 9 
	{nAddRage = 0, nCostRage = 0, nDamage = 86 * 0.95, nDamageRand = 86 * 0.1}, -- Level 10
	
};           
             
--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	
	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel;

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/�ؽ�/�ؽ�_���ӷ�_Х��.lua",
		0
	);
	
	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	--skill.SetPublicCoolDown(16);		
	skill.SetNormalCoolDown(1, 347);
	skill.SetNormalCoolDown(2, 964);
	skill.SetCheckCoolDown(1, 444)
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	
	----------------- ����������� ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;
	--	skill.nChannelInterval	= 32;
	skill.nMinRadius = 0 * LENGTH_BASE;					--����ʩ����С�뾶
	skill.nMaxRadius = 4 * LENGTH_BASE;							--����ʩ�����뾶
	skill.nAngleRange = 128; 										--ʩ�ŽǶ�,ȫ��256
	--skill.nAreaRadius		= 6 * LENGTH_BASE;	
	--skill.nWeaponDamagePercent	= 0;
	skill.nPrepareFrames = 0;										--����֡��,16֡����1��
    
	skill.nBulletVelocity = 0;										--�ӵ��ٶ�,��/֡
    
	skill.nBreakRate = 0;									--����ϵĸ���,Ĭ��1024��ʾһ�������
	--	skill.nTargetCountLimit	= 1;
	return true;
end


--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
	local nWenshuijueLvl = player.GetSkillLevel(10144)
	local nShanjujianyiLvl = player.GetSkillLevel(10145)
	if nWenshuijueLvl == 0 or nShanjujianyiLvl == 0 then
		return false;
	end
	return nPreResult;
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)

end

function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	local nWenshuijueLvl = player.GetSkillLevel(10144)
	local nShanjujianyiLvl = player.GetSkillLevel(10145)
	local Kungfu = player.GetKungfuMount()
	if Kungfu.dwSkillID == 10144 then
		player.CastSkill(1658, 1)
		--[[
		if player.GetSkillLevel(5957) ~= 1 then
			player.CastSkill(9027, 1)
		end
		--]]
		player.CastSkill(9027, 1)
		
		--9_3
		--[[
		if player.GetSkillLevel(5964) == 1 then
			player.AddBuff(dwCharacterID, player.nLevel, 5731, 1, 1)
		end
		--]]
		if player.GetSkillLevel(5966) == 1 then
			if not player.GetBuff(5733, 1) then
				player.CastSkill(6171, 1)
				player.AddBuff(dwCharacterID, player.nLevel, 5733, 1, 1)
				player.PlaySfx(481, player.nX, player.nY, player.nZ)
			end
		end

		--������ʩչХ��,������Ѫ10��
		if player.GetSkillLevel(14604) == 1 then
			player.AddBuff(player.dwID, player.nLevel, 9700, 1, 10)
		end

		--��ˮ��ʩչХ�ռ��������5%,ÿ����5��,ʱ���ۼӵ�buff
		if player.GetSkillLevel(14605) == 1 then
			player.AddBuff(player.dwID, player.nLevel, 9701, 1, 2)
		end
		--[[
		--7_1
		if player.GetSkillLevel(6537) == 1 then
			if not player.GetBuff(6141, 1) then
				player.AddBuff(dwCharacterID,player.nLevel,6406,1,24)
			end
		end
		--]]

		if player.GetBuff(9900, 1) then
			player.DelBuff(9900, 1)
		end
	elseif Kungfu.dwSkillID == 10145 then
		--�л����ؽ�ɾ���ὣ�µ������Ѩ����Ч��
		if player.GetBuff(9701, 1) then
			player.DelBuff(9701, 1)
		end
		
		player.CastSkill(1659, 1)
		--9_1
		--[[
		if player.GetSkillLevel(5965) == 1 then
			player.AddBuff(dwCharacterID, player.nLevel, 5732, 1, 1)
		end
		--]]

		--�ὣ״̬������1.5���Ϣ
		if player.GetSkillLevel(6799) == 1 and not player.GetBuff(9900, 1) then
			player.AddBuff(player.dwID, player.nLevel, 9900, 1)
		end
	end
	
	--9_2
	if player.GetSkillLevel(6547) == 1 then
		player.AddBuff(dwCharacterID, player.nLevel, 6146, 1, 1)
	end
	--5_4
	--[[
	if player.GetSkillLevel(6799) == 1 then
		player.CastSkill(6801, 1)
	end
	--]]
	if player.GetSkillLevel(6547) == 1 then
		player.CastSkill(6801, 1)
	end

	ModityCDToUI(player, 1656, 0, 0)
end

function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com