---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/Quest/��ʷ֮��_����˻_�ٻ�������������.lua
-- ����ʱ��:	2013/5/29 19:50:10
-- �����û�:	zhengfeng4
-- �ű�˵��:	
----------------------------------------------------------------------<

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")
tSkillData = 
{
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 1
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 2
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 3
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 4
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 5
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 6
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 7
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 8
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 9
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 10
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/Quest/��ʷ֮��_����˻_�ٻ�������������.lua", -- ����ֵ1
		0														-- ����ֵ2
	);
    	
	----------------- ħ������ -------------------------------------------------
	--[[
   	skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.nAttributeEffectMode,					-- ��������ģʽ
   		ATTRIBUTE_TYPE.nAttributeKey,								-- ħ������
   		nAttributeValue1,											-- ����ֵ1
   		nAttributeValue2											-- ����ֵ2
   		);
    --]]
    
	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
	--skill.AddSlowCheckSelfOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- �������������Լ���Buff
	--skill.AddSlowCheckDestOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- ����Ŀ�������Լ���Buff   

	-----------------����ʩ�ż�������-------------------------------------------
	--skill.AddCheckSelfLearntSkill(dwSkillID, dwSkillLevel, LevelCompareFlag);     --���Ƚ�Caster�Լ���ѧϰ�ļ���ID�͵ȼ�
	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, nBuffID, nBuffLevel);		-- ����1��λBuff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����2��λBuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����3��λBuff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff

	----------------- ����Cool down --------------------------------------------
	-- ����CD
	--skill.SetPublicCoolDown(16);							-- ����CD 1.5��
	-- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	--skill.SetNormalCoolDown(CoolDownIndex, nCoolDownID);	--������ͨCD
	--skill.SetCheckCoolDown(CoolDownIndex, nCoolDownID);	--ֻ��鲻�ߵ�CD
	----------------- ����������� ---------------------------------------------
	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
	--skill.dwLevelUpExp	= 0;    				-- ��������
	--skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- ���ܳ�� -------------------------------------------------
	--skill.nBaseThreat		= 0;

	----------------- �������� -------------------------------------------------
	--skill.nCostLife		= 0;									-- ������������ֵ
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- �������ĵ�����
	--skill.nCostStamina	= 0;									-- �������ĵ�����
	--skill.nCostItemType	= 0;									-- �������ĵ���Ʒ����
	--skill.nCostItemIndex	= 0;									-- �������ĵ���Ʒ����ID
    
	----------------- ������� -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)
    
	----------------- ��״������� ---------------------------------------------
	--skill.nChainBranch	= 1;					--��״���ܷ�֧��
	--skill.nChainDepth		= 3;					--��״���ܲ���
	--��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨
    
	----------------- ʩ�ž��� -------------------------------------------------
	skill.nMinRadius = 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С���� 
	skill.nMaxRadius = 30 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	--skill.nProtectRadius = 0 * LENGTH_BASE;                     -- ���κ;���AOE�ı������룬��Χ�ڲ����˺�
	--skill.nHeight = 0 * LENGTH_BASE;                            -- AOE�ĸ߶ȣ�ȫ�ߣ�Բ����AOE�в���Ϊ2����nAreaRadius������AOE�в���ΪnAreaRadius
	--skill.nRectWidth = 0 * LENGTH_BASE;                         -- ����AOE�Ŀ�ȣ�ȫ������ΪnAreaRadius
	skill.nAngleRange = 256;					-- ������Χ�����νǶȷ�Χ
	skill.nAreaRadius = 30 * LENGTH_BASE;		-- �������ð뾶 
	--skill.nTargetCountLimit	= 2;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- ����֡��
	--skill.nChannelInterval	= 0; 				-- ͨ�������ʱ�� 
	--skill.nChannelFrame		= 0;	 			-- ͨ��������ʱ�䣬��λ֡�� 
	--skill.nBulletVelocity		= 0;				-- �ӵ��ٶȣ���λ ��/֡
    
	----------------- ����� -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- �Ƿ����ۼ���
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- ����ķ�Χ
	--skill.nLeastFormationPopulation	= 2;		-- ����ķ�Χ�����ٶ�Ա���������ӳ���
    
	----------------- Ŀ��Ѫ������ ---------------------------------------------
	--skill.nTargetLifePercentMin	= 0;			-- Ѫ����Сֵ>=
	--skill.nTargetLifePercentMax	= 100;			-- Ѫ�����ֵ<=
    
	----------------- ����Ѫ������ ---------------------------------------------
	--skill.nSelfLifePercentMin	= 0;				-- Ѫ����Сֵ>=
	--skill.nSelfLifePercentMax	= 100;				-- Ѫ�����ֵ<=
    
	----------------- ���˴��������� -------------------------------------------------
	--skill.nBeatBackRate       = 1 * PERCENT_BASE;		-- ���ܱ����˵ĸ���,Ĭ��1024
	--skill.nBrokenRate         = 1 * PERCENT_BASE;		-- ���ܱ���ϵĸ���,Ĭ��1024
	--skill.nBreakRate			= 0 * PERCENT_BASE;		-- ���Ŀ��ʩ���ĸ���,����1024
	
	--skill.nDismountingRate	= 0;					-- ��Ŀ�����������,����1024��Ĭ��0
	
	----------------- �����˺���� ---------------------------------------------
	--skill.nWeaponDamagePercent		= 0;			-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%
	
	return true;
end

-- �Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
	return nPreResult;
end

-- ��������ʱ���ô˺���������skillΪ�������skill����һ�λ��ĳ������ʱҲ���ô˽ű�
function OnSkillLevelUp(skill, player)

end
local LASTTIME = 28800
local tFormation = {
--dwID,true,nRadius,nFace,nRadian,nDisFrames,szName--npcID,npc����doodad,�뾶���ȣ������npc���򡣽Ƕȡ�Сʱʱ��,����
	{25515, true, 500, 0, 0, 115200},
	{25515, true, 300, 0, (1 / 6 * math.pi), 115200},
	{25515, true, 300, 0, (1 / 2 * math.pi), 115200},
	{25515, true, 300, 0, (5 / 6 * math.pi), 115200},
	{25515, true, 500, 0, (1 * math.pi), 115200},
	{25515, true, 300, 0, (7 / 6 * math.pi), 115200},
	{25515, true, 300, 0, (9 / 6 * math.pi), 115200},
	{25515, true, 300, 0, (11 / 6 * math.pi), 115200},
}
--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local scene = player.GetScene()
	local nTargetType, dwTargetID = player.GetTarget()
	if not dwTargetID or (nTargetType ~= TARGET.NPC and nTargetType ~= TARGET.PLAYER) then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(5, 8751), 3)
		return
	end
	local target = nil
	if nTargetType == TARGET.PLAYER then
		target = GetPlayer(dwTargetID)

	elseif nTargetType == TARGET.NPC then
		target = GetNpc(dwTargetID)
	end
	if not target then
		return
	end
	if nTargetType == TARGET.NPC then
		if target.dwForceID ~= 28 and target.dwForceID ~= 29 then
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(5, 9133), 3)
			return
		end
	end
	if nTargetType == TARGET.PLAYER then
		if target.dwID == player.dwID then
			return
		end
		local nRan = Random(3)
		if nRan == 1 then
			player.Talk(GetEditorString(5, 9134)..target.szName, 5)
		elseif nRan == 2 then
			player.Talk(GetEditorString(4, 1547)..target.szName..GetEditorString(5, 8753),5)
		else
			player.Talk(target.szName..GetEditorString(5, 8754),5)
		end
	end

	for i = 1, 10 do
		local npc = scene.GetNpcByNickName("Act610CallArmy"..i)
		if npc then
			if GetCharacterDistance(dwTargetID, npc.dwID) < 3000 then
				npc.Say(GetEditorString(4, 6657))
				npc.ModifyThreat(dwTargetID, 10000000)
			end
		end
		for j = 1,#tFormation do
			local fellow = scene.GetNpcByNickName("Act610CallArmy"..i.."F"..j) 
			if fellow then
				if GetCharacterDistance(dwTargetID,fellow.dwID) < 3000 then
					fellow.ModifyThreat(dwTargetID, 10000000)
				end
			end
		end
	end
	--local nX, nY, nZ = player.GetCoordinateSkillTarget()
	--local scene = player.GetScene()
	--local i = 1
	--for i = 1, 10 do
	--local npc = scene.GetNpcByNickName("Act610CallArmy"..i)
	--if not npc then
	--npc = scene.CreateNpc(25405, nX, nY, nZ, player.nFaceDirection, LASTTIME, "Act610CallArmy"..i)
	--CreatNpcByRadiation(npc, tFormation)
	--return
	--end
	--end
	--RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", "���ڵ�����������ࡣ", 3)
	
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
function CreatNpcByRadiation(npc, tFormation)--������������ͱ���npc��doodad��npc����npc��������Χ�Ƶ�npc����ӵ��������������ּ�Fi
	local scene = npc.GetScene()
	if not scene then
		return
	end
	for i = 1, #tFormation do
		local nFaceDirection = tFormation[i][4] + npc.nFaceDirection
		local nZ = npc.nZ
		local nX, nY = GetPosition(npc.nX, npc.nY, npc.nFaceDirection, tFormation[i][3], tFormation[i][5])
		if tFormation[i][2] then--npc
			local fellow = scene.CreateNpc(tFormation[i][1], nX, nY, nZ, nFaceDirection, -1, npc.szName.."F"..i)
			if fellow and tFormation[i][6] then
				fellow.SetDisappearFrames(tFormation[i][6])
			end
		end
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com